How to configure hosts in network
---------------------------------

Edit ``/etc/hosts`` on each node and add entries of hosts as per requirement

.. code-block:: console

	#CONTROLLER NODE
	10.0.0.11   controller

	# NETWORK NODE
	10.0.0.21   network
	
	# COMPUTE NODES
	10.0.0.31   compute1
	10.0.0.32   compute2
	10.0.0.33   compute3
	10.0.0.34   compute4
	10.0.0.35   compute5
	10.0.0.36   compute6
	10.0.0.37   compute7
	10.0.0.38   compute8
	10.0.0.39   compute9
	10.0.0.40   compute10
	
	# BLOCK STORAGE NODES
	10.0.0.41   block1
	10.0.0.42   block2
	
	# OBJECT STORAGE NODES 
	10.0.0.51   object1
	10.0.0.52   object2

.. note:: You can change ip addresses according to your network configuration.
