Create Network and Subnet
-------------------------

#. Login to Openstack Dashboard as normal user (demo).

   .. image:: /_images/instance-overview.png
      :scale: 50

#. Navigate to Network. Select Network Topology or Networks.

   .. image:: /_images/nt-network-topology.png
      :scale: 50

#. Click on "Create Network". Enter the Network name and set Admin State ``UP``. Click next

   .. image:: /_images/nt-create-network.png
      :scale: 50

#. Set the options Subnet Name, Network Address(CIDR Format), IP Version and Gateway IP. Click next

   .. image:: /_images/nt-subnet.png
      :scale: 50

#. Set additional details as per your requirement or leave blank. Click create.

   .. image:: /_images/nt-subnet-details.png
      :scale: 50

#. Once you have created Network, Network topology will look like below.

   .. image:: /_images/nt-network-topology-demo-net.png
      :scale: 50

Create router
-------------

#. Click on "Create router". Enter Router Name, set Admin State ``UP`` and External Network ``VJTINet``.

   .. image:: /_images/nt-create-router.png
      :scale: 50

#. Navigate to Routers. Click on the router you just created.

   .. image:: /_images/nt-routers.png
      :scale: 50

#. Select the "Interfaces" tab and click on "Add Interface".

   .. image:: /_images/nt-router-details.png
      :scale: 50

#. Select "Subnet", IP Address for router interface(Optional). Click on Add Interface.

   .. image:: /_images/nt-router-add-interface.png
      :scale: 50

#. Final Network Topology will look like below.

   .. image:: /_images/nt-network-topology-final.png
      :scale: 50
