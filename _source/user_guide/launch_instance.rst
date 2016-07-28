.. Launch an instance
.. ==================

.. link:: http://www.unixarena.com/2015/08/how-to-launch-the-first-openstack-instance.html

.. 1. Go to ``Project > Compute > Access & Security > Key Pairs`` then create key Pair or Import Key Pair

.. 2. Go to ``Project > Network > Networks`` then create Network

.. 3. Go to ``Project > Compute > Instances`` then Launch Instance

.. _create_network:

Create Network, Subnet and router
---------------------------------

#. Login to Openstack Dashboard as normal user (demo).

   .. image:: /_images/instance-overview.png
      :scale: 100

#. Navigate to Network. Select Network Topology or Networks.

   .. image:: /_images/nt-network-topology.png
      :scale: 100

#. Click on "Create Network". Enter the Network name and set Admin State ``UP``. Click next

   .. image:: /_images/nt-create-network.png
      :scale: 100

#. Set the options Subnet Name, Network Address(CIDR Format), IP Version and Gateway IP. Click next

   .. image:: /_images/nt-subnet.png
      :scale: 100

#. Set additional details as per your requirement or leave blank. Click create.

   .. image:: /_images/nt-subnet-details.png
      :scale: 100

#. Once you have created Network, Network topology will look like below.

   .. image:: /_images/nt-network-topology-demo-net.png
      :scale: 100

#. Click on "Create router". Enter Router Name, set Admin State ``UP`` and External Network ``VJTINet``.

   .. image:: /_images/nt-create-router.png
      :scale: 100

#. Navigate to Routers. Click on the router you just created.

   .. image:: /_images/nt-routers.png
      :scale: 100

#. Select the "Interfaces" tab and click on "Add Interface".

   .. image:: /_images/nt-router-details.png
      :scale: 100

#. Select "Subnet", IP Address for router interface(Optional). Click on Add Interface.

   .. image:: /_images/nt-router-add-interface.png
      :scale: 100

#. Final Network Topology will look like below.

   .. image:: /_images/nt-network-topology-final.png
      :scale: 100


.. _create_security_group:

Create security group & configure the rules
-------------------------------------------------------

.. #. Login to Openstack Dashboard as normal user (demo).

..   .. image:: /_images/instance-overview.png

#. Navigate to Access & Security. Select the tab called “Security Groups”.

   .. image:: /_images/as-access-security.png
      :scale: 100

#. Click on “Create Security group”. Enter the name and description for the security group.

   .. image:: /_images/as-create-security-group.png
      :scale: 100

#. Once the group has been created successfully, Click on “Manage Rules”.

   .. image:: /_images/as-manage-rules.png
      :scale: 100

#. Click  on “Add Rule”.

   .. image:: /_images/as-add-rule.png
      :scale: 100

#. Allow ssh from anywhere to the instances (SSH).

   .. image:: /_images/as-add-rule-SSH.png
      :scale: 100

#. Similarly , allow “ping” as well to this host from anywhere (ALL ICMP).

   .. image:: /_images/as-add-rule-PING.png
      :scale: 100

   Once you have added those rules to the security group, it will look like below.


   .. image:: /_images/as-after-adding-rule.png
      :scale: 100

.. _create_key_pair:

Create key-pair
---------------
To access the instance without password.

.. #. Login to Openstack Dashboard.

#. Navigate to security & access. Click the tab called “Key Pairs” and click on  “Create key Pair”.

   .. image:: /_images/ask-key-pairs.png
      :scale: 100

#. Enter the Key pair name.  (Keep Some meaning full name). Click on “Create key Pair”.

   .. image:: /_images/ask-create-key-pair.png
      :scale: 100

#. The key pair will be automatically downloaded to your laptop.  If it didn’t download, click the link to download it. Keep the key safe since you can’t download it again.

   .. image:: /_images/ask-download-key-pair.png
      :scale: 100

.. _launch_an_instance:

Launch an instance
-------------------

.. #. Login to Openstack Dashboard.

.. #. :ref:`create_network`
.. #. :ref:`create_security_group`
.. #. :ref:`create_key_pair`

#. Click on “Launch Instance ” button.

   .. image:: /_images/instances-launch-instance.png
      :scale: 100

#. Set the instance details like below.

   .. image:: /_images/instances-launch-details.png
      :scale: 100

   **Availability Zone** – nova .  (Need to select your compute node).

   **Instance Name** – Enter the desired instance name

   **Flavour** – Select the available flavour according  to your need. (See the details in right side)

   **Instance Count** –  Enter the instance Count

   **Boot Source** – Select boot from pre-defined image.

   **Image Name** – select “cirros” since its very small Linux foot print for testing openstack.

#. Click on Access & security tab for the instance. From the drop down box, select the key pair “demo-key” which we have created earlier. Also select the security group which we have created.

   .. image:: /_images/instances-launch-access&security.png
      :scale: 100

#. Click on Networking tab, Select network by clicking on **+** sign.

   .. image:: /_images/instances-launch-networking.png
      :scale: 100

#. You can customise your instance after it has launched using the **Post Creation** (optional) option. Following is a example script to set password to user in Ubuntu Server and centOS cloud images.

   ::

   	   #cloud-config
	   password: mypassword
	   chpasswd: { expire: False }
	   ssh_pwauth: True

#. Specify **Advanced options** (optional) to use when launching an instance. Click “Launch” to launch the new instance.

#. Here you can see that instance has been launched. It will take few seconds/minutes to boot the instance depends on the image size which we have selected.

   .. image:: /_images/instances-launch-running.png
      :scale: 100

#. If you would like to see the instance console, click the instance name and select the console tab. You should be able to access the instance here as well by double clicking the console bar.

   .. image:: /_images/instances-launch-console.png
      :scale: 100

#. You can also check the log to know the instance is booted or not. (If console is not working)

   .. image:: /_images/instances-launch-log.png
      :scale: 100

#. Assign floating ip to an instance so we can access it from external network.

   .. image:: /_images/instances-access-floating-ip.png
      :scale: 100

#. Add Floating IP from pool of IP addresses.

   .. image:: /_images/instances-access-floating-ip-range.png
      :scale: 100

#. Allocate IP.

   .. image:: /_images/instances-access-floating-ip-allocate.png
      :scale: 100

#. Associate to your VM.

   .. image:: /_images/instances-access-floating-ip-associate.png
      :scale: 100

#. You can see floating IP in instance table.

   .. image:: /_images/instances-access-floating-ip-table.png
      :scale: 100

#. Now you can SSH into your VM using following.

::

	ssh -i key.pem username@floating-ip-of-VM

for example

::

	ssh -i demo-key.pem cirros@172.18.38.140
