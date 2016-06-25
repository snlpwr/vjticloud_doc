Launch an instance
==================

.. link:: http://www.unixarena.com/2015/08/how-to-launch-the-first-openstack-instance.html
 
.. 1. Go to ``Project > Compute > Access & Security > Key Pairs`` then create key Pair or Import Key Pair 

.. 2. Go to ``Project > Network > Networks`` then create Network 

.. 3. Go to ``Project > Compute > Instances`` then Launch Instance 

Create the Network and Subnet
-----------------------------

#. Login to Openstack Dashboard as normal user (demo).

   .. image:: /_images/instance-overview.png

#. Navigate to Network. Select Network Topology or Networks.

   .. image:: /_images/nt-network-topology.png

#. Click on "Create Network". Enter the Network name and set Admin State ``UP``. Click next

   .. image:: /_images/nt-create-network.png

#. Set the options Subnet Name, Network Address(CIDR Format), IP Version and Gateway IP. Click next

   .. image:: /_images/nt-subnet.png

#. Set additional details as per your requirement or leave blank. Click create.

   .. image:: /_images/nt-subnet-details.png

#. Once you have created Network, Network topology will look like below.

   .. image:: /_images/nt-network-topology-demo-net.png

#. Click on "Create router". Enter Router Name, set Admin State ``UP`` and External Network ``VJTINet``. 

   .. image:: /_images/nt-create-router.png

#. Navigate to Routers. Click on the router you just created.

   .. image:: /_images/nt-routers.png

#. Select the "Interfaces" tab and click on "Add Interface".

   .. image:: /_images/nt-router-details.png

#. Select "Subnet", IP Address for router interface(Optional). Click on Add Interface.

   .. image:: /_images/nt-router-add-interface.png

#. Final Network Topology will look like below.

   .. image:: /_images/nt-network-topology-final.png

Create the Network security group & Configure the Rules
-------------------------------------------------------

.. #. Login to Openstack Dashboard as normal user (demo).
   
..   .. image:: /_images/instance-overview.png

#. Navigate to Access & Security. Select the tab called “Security Groups”.

   .. image:: /_images/as-access-security.png

#. Click on “Create Security group”. Enter the name and description for the security group.

   .. image:: /_images/as-create-security-group.png

#. Once the group has been created successfully, Click on “Manage Rules”.

   .. image:: /_images/as-manage-rules.png

#. Click  on “Add Rule”.

   .. image:: /_images/as-add-rule.png

#. Allow ssh from anywhere to the instances (SSH).

   .. image:: /_images/as-add-rule-SSH.png

#. Similarly , allow “ping” as well to this host from anywhere (ALL ICMP).

   .. image:: /_images/as-add-rule-PING.png

   Once you have added those rules to the security group, it will look like below.


   .. image:: /_images/as-after-adding-rule.png


Create the key-pair to access the instance
------------------------------------------

.. #. Login to Openstack Dashboard.

#. Navigate to security & access. Click the tab called “Key Pairs” and click on  “Create key Pair”.

   .. image:: /_images/ask-key-pairs.png

#. Enter the Key pair name.  (Keep Some meaning full name). Click on “Create key Pair”.

   .. image:: /_images/ask-create-key-pair.png

#. The key pair will be automatically downloaded to your laptop.  If it didn’t download, click the link to download it. Keep the key safe since you can’t download it again.

   .. image:: /_images/ask-download-key-pair.png


Launch the New Openstack Instance
---------------------------------

.. #. Login to Openstack Dashboard.

#. Click on “Launch Instance ” button.

   .. image:: /_images/instances-launch-instance.png

#. Set the instance details like below.

   .. image:: /_images/instances-launch-details.png

   **Availability Zone** – nova .  (Need to select your compute node).
   
   **Instance Name** – Enter the desired instance name
   
   **Flavour** – Select the available flavour according  to your need. (See the details in right side)
   
   **Instance Count** –  Enter the instance Count
   
   **Boot Source** – Select boot from pre-defined image.
   
   **Image Name** – select “cirros” since its very small Linux foot print for testing openstack.

#. Click on Access & security tab for the instance. From the drop down box, select the key pair “demo-key” which we have created earlier. Also select the security group which we have created.

   .. image:: /_images/instances-launch-access&security.png

#. Click on Networking tab, Select network by clicking on **+** sign.

   .. image:: /_images/instances-launch-networking.png

#. You can customise your instance after it has launched using the **Post Creation** (optional) option.

#. Specify **Advanced options** (optional) to use when launching an instance. Click “Launch” to launch the new instance.

#. Here you can see that instance has been launched. It will take few seconds/minutes to boot the instance depends on the image size which we have selected.

   .. image:: /_images/instances-launch-running.png

#. If you would like to see the instance console, click the instance name and select the console tab. You should be able to access the instance here as well by double clicking the console bar.

   .. image:: /_images/instances-launch-console.png

#. You can also check the log to know the instance is booted or not. (If console is not working)

   .. image:: /_images/instances-launch-log.png

#. Assign floating ip to an instance so we can access it from external network.

   .. image:: /_images/instances-access-floating-ip.png

#. Add Floating IP from pool of IP addresses.

   .. image:: /_images/instances-access-floating-ip-range.png

#. Allocate IP.

   .. image:: /_images/instances-access-floating-ip-allocate.png

#. Associate to your VM.

   .. image:: /_images/instances-access-floating-ip-associate.png

#. You can see floating IP in instance table.

   .. image:: /_images/instances-access-floating-ip-table.png

#. Now you can SSH into your VM using following.

::

	ssh -i key.pem username@floating-ip-of-VM

for example

::

	ssh -i demo-key.pem cirros@172.18.38.140


