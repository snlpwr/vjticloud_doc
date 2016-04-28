How to configure network interfaces
-----------------------------------

As per openstack kilo documentation we require to deal with 4 type of networks as follows

**Management Network**

	Management network is used for communication between openstack services

**Tunnel Network**

	Tunnel network is used for handling network connections of VM from compute node to network node

**Storage Network**

	Storage network is used for increasing disk access speed

**External Network**

	External network is used for providing internet connection to VM's. This is where Floating IP's come into picture.

**Controller**

configure /etc/network/interfaces on controller node as follows

::

	# The loopback network interface
	auto lo
	iface lo inet loopback
	
	# The primary network interface
	# controller Internet Connection
	auto p5p1
	iface p5p1 inet dhcp

	# Management network
	auto p5p1:0 
	iface p5p1:0 inet static
	    address 10.0.0.11
	    network 10.0.0.0
	    netmask 255.255.255.0   

	# Additional interface for accessing cloud in intranet 
	auto eth1
	iface eth1 inet static
	  address 172.18.38.25
	  network 172.18.38.0
	  netmask 255.255.255.0
	  gateway 172.18.38.1
