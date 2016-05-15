Live Migration
~~~~~~~~~~~~~~

Live migration is the movement of a live instance from one compute node to another. A hugely sought-after feature by cloud administrators, it’s used primarily to achieve zero downtime during cloud maintenance and can also be a useful feature to achieve performance as live instances can be moved from a heavily loaded compute node to a less loaded compute node.

Planning for live migration has to be done at the initial stage of planning and designing an OpenStack deployment. Some things to take into consideration are as follows:

* At the moment, not all hypervisors support live migration in OpenStack; therefore, it’s best to check HypervisorSupportMatrix to see if your hypervisor supports live migration. :term:`KVM`, QEMU, XenServer/XCP, and HyperV are some of the currently supported hypervisors.

* In a typical Openstack deployment, every compute node manages its instances locally in a dedicated directory (for example, ``/var/lib/nova/instances/``) but for live migration, this folder has to be in a centralized location and shared across all the compute nodes. Hence, a shared file system or block storage is an important requirement for enabling live migration. For shared storage, a distributed file system such as GlusterFS, NFS needs to be properly configured and running before live migration can be performed. SAN storage protocols such as Fibre Channel (FC) and iSCSI can also be used for shared storage.

* For file permissions when accessing the centralized storage in the shared storage, you must ensure that the UID and GID of Compute (nova) user is the same on the controller node and on all of the compute nodes (the assumption here is that the shared storage is on the controller node). Also, the UID and GID of libvirt-qemu must be the same on all compute nodes.

* It’s important to specify vncserver_listen=0.0.0.0 so that vnc server can accept connections from all of the compute nodes regardless of where the instances are running. If this is not set, accessing the migrated instances through vnc could be an issue because the destination compute node’s ip address does not match that of the source compute node.

The following instructions enable live migration on an OpenStack multinode deployment using KVM hypervisor running Ubuntu 14.04 LTS with an NFS shared storage. 

Implementing NFS shared storage
-------------------------------

The cloud controller node is the NFS server. The aim is to share ``/var/lib/nova/instances`` across all of the compute nodes in your Openstack cluster. This directory contains libvirt KVM file-based disk images for the instances hosted on that compute node. If you are not running your cloud in a shared storage environment, this directory will be unique across all compute nodes. 

.. warning:: Note that if you already have instances running in your cloud before configuring live migrations, you need to take precautions that the existing instances are not overridden.

**On the NFS server/controller node, take the following steps:**

1. Install the NFS server.

::

	root@controller:/home/sunil# apt-get install nfs-kernel-server

2. Ensure that the file ``/etc/idmapd.conf`` has the following:

::

	[Mapping]
	Nobody-User = nobody
	Nobody-Group = nogroup

3. To share ``/var/lib/nova/instances``, add the following to ``/etc/exports``:

::

	/var/lib/nova/instances 10.0.0.0/24(rw,sync,fsid=0,no_root_squash)

.. note:: 10.0.0.0/24 is the network address of your compute nodes (usually called data network) for your OpenStack cluster.

4. Set the ‘execute’ bit on your shared directory as follows, so that qemu can use the images within the directories when exported to the compute nodes.

::

	root@controller:/home/sunil# chmod o+x /var/lib/nova/instances

5. Restart the services.

::
	
	root@controller:/home/sunil# service nfs-kernel-server restart
	root@controller:/home/sunil# sudo initctl restart idmapd

**On each of the compute nodes, take the following steps:**

1. Install the NFS client services.

::

        root@compute1:/home/sunil# apt-get install nfs-common

2. Mount the shared file system from the NFS server.

::

        mount controller:/var/lib/nova/instances /var/lib/nova/instances

.. note:: You can specify your NFS server in place of controller.

3. To save from retyping this after every reboot, add the following line to ``/etc/fstab``:

::

	controller:/ /var/lib/nova/instances nfs auto 0 0

4. Check on all the compute nodes and ensure the permissions are set as listed below. This indicates that the correct permissions are set on the controller node with the chmod +x command above.

::

	sunil@compute1:~$ ls -ld /var/lib/nova/instances/
	drwxr-xr-x 45 nova nova 4096 May 15 14:42 /var/lib/nova/instances/

5. Ensure that the exported directory can be mounted and check that it’s mounted.

::

	root@compute1:/home/sunil# mount -a -v
	root@compute1:/home/sunil# df -k
	Filesystem                         1K-blocks     Used Available Use% Mounted on
	/dev/sda6                          229729508  3708556 214328308   2% /
	none                                       4        0         4   0% /sys/fs/cgroup
	udev                                 8139980        4   8139976   1% /dev
	tmpfs                                1630248      692   1629556   1% /run
	none                                    5120        0      5120   0% /run/lock
	none                                 8151224        0   8151224   0% /run/shm
	none                                  102400        0    102400   0% /run/user
	controller:/var/lib/nova/instances 229730304 14373888 203663360   7% /var/lib/nova/instances

Ensure that the last line above is as indicated. This line indicates that the ``/var/lib/nova/instances`` is correctly exported from NFS server. If this line is missing, your NFS share may not be working properly and you need to fix it before you proceed.

6. Update the libvirt configurations. Modify ``/etc/libvirt/libvirtd.conf``.

::

        listen_tls = 0

        listen_tcp = 1

        auth_tcp = "none"

7. Modify line "exec /usr/sbin/libvirtd -d" of ``/etc/init/libvirt-bin.conf`` as

::

        exec /usr/sbin/libvirtd -d -l

-l is short for –listen

8. Modify ``/etc/default/libvirt-bin``.

::

        libvirtd_opts = "-d -l"

9. Restart libvirt. After executing the command, ensure that libvirt is successfully restarted.

::

        root@compute1:/home/sunil# stop libvirt-bin && start libvirt-bin
        root@compute1:/home/sunil# ps -ef | grep libvirt

Miscellaneous configurations
----------------------------

These steps are to ensure that the nova UID and GID are the same on the controller node and on all the compute nodes. Also, the libvirt-qemu UID and GID must be the same on all compute nodes. This involves manually changing the GIDs and UIDs to ensure that they’re uniform on the compute and controller nodes.

The steps are as follows:

1. On the controller node, check the nova id and then implement the same on all of the compute nodes:

::

        sunil@controller:~$ id nova
	uid=111(nova) gid=119(nova) groups=119(nova)


2. Now that we know the nova UIDs and GIDs, we can change them on all of the compute nodes as follows:

::

        root@compute1:/home/sunil# usermod -u 111 nova
	root@compute1:/home/sunil# groupmod -g 119 nova

.. warning:: Note down old user-id and group-id before changing.

Follow the same procedures for all of the compute nodes.

3. Repeat the same for libvirt-qemu but keep in mind that the controller node does not have this user because the controller node does not run a hypervisor. Ensure that all of the compute nodes have the same UID and GID for user libvirt-qemu.

4. Since we have changed the UIDs and GIDs of user nova and libvirt-qemu, we need to ensure that this is reflected across all of the files owned by these users. We achieve this by through the next step. Stop the nova-api and libvirt-bin services on the compute node. Change all of the files owned by nova and nova group to the new UID and GID, respectively. For example:

::

        root@compute1:/home/sunil# service nova-compute stop
        root@compute1:/home/sunil# service libvirt-bin stop
	root@compute1:/home/sunil# find / -uid 107 -exec chown nova {} \; # note the 107 here is the old nova uid before the change
        root@compute1:/home/sunil# find / -uid 108 -exec chown libvirt-qemu {} \; # note the 108 here is the old nova uid before the change
        root@compute1:/home/sunil# find / -gid 114 -exec chgrp nova {} \; #note the 114 here is the old nova uid before the change
        root@compute1:/home/sunil# find / -gid 113 -exec chgrp libvirt-qemu {} \; #note the 113 here is the old nova uid before the change
        root@compute1:/home/sunil# service nova-compute restart
        root@compute1:/home/sunil# service libvirt-bin restart

Reference:
`Mirantis Live Migration <https://www.mirantis.com/blog/tutorial-openstack-live-migration-with-kvm-hypervisor-and-nfs-shared-storage/>`__, `OpenStack: Admin guide > Configure migrations <http://docs.openstack.org/admin-guide/compute-configuring-migrations.html>`__
