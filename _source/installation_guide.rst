Deployment Guide
================

.. note:: This is awesome note

.. warning:: This is warning


How to configure network interfaces
-----------------------------------

As per openstack kilo documentation we require 3 networks as follows \*
#### Management network

::

    Management network is used for communication between openstack services

-  .. rubric:: Tunnel network
      :name: tunnel-network

   Tunnel network is used for handling network connections of VM from
   compute node to network node
-  .. rubric:: Storage network
      :name: storage-network

   Storage network is used for increasing disk access speed
-  .. rubric:: External network
      :name: external-network

   External network is used for providing internet connection to VM’s.
   This is where Floating IP’s come into picture.

Controller
----------

configure ``/etc/network/interfaces`` on controller node as follows

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

Network
-------

configure ``/etc/network/interfaces`` on network node as follows

::

    # The loopback network interface
    auto lo
    iface lo inet loopback

    # The primary network interface
    # network Internet Connection
    auto p5p1
    iface p5p1 inet dhcp

    # Management Network
    auto p5p1:0
    iface p5p1:0 inet static 
        address 10.0.0.21
        network 10.0.0.0
        netmask 255.255.255.0

    # Tunnel Network
    auto p5p1:1
    iface p5p1:1 inet static
        address 10.0.1.21
        network 10.0.0.0
        netmask 255.255.255.0

    # External network interface1 
    auto eth0
    iface eth0 inet manual
        up ip link set dev $IFACE up
        down ip link set dev $IFACE down

    # External network interface2
    auto eth1
    iface eth1 inet manual
      up ip link set dev $IFACE up
      down ip link set dev $IFACE down

Compute
-------

configure ``/etc/network/interfaces`` on compute1 node as follows

::

    # The loopback network interface
    auto lo
    iface lo inet loopback

    # The primary network interface
    # compute1 Internet Connection
    auto p5p1
    iface p5p1 inet dhcp

    # Management network
    auto p5p1:0
    iface p5p1:0 inet static
        address 10.0.0.31
        network 10.0.0.0
        netmask 255.255.255.0

    # Tunnel network
    auto p5p1:1
    iface p5p1:1 inet static
        address 10.0.1.31
        network 10.0.1.0
        netmask 255.255.255.0

    # Storage network
    auto p5p1:2
    iface p5p1:2 inet static
        address 10.0.2.31
        network 10.0.2.0
        netmask 255.255.255.0
        

Block1
------

configure ``/etc/network/interfaces`` on block1 node as follows

::

    # The loopback network interface
    auto lo
    iface lo inet loopback

    # The primary network interface
    # block1 Internet Connection
    auto p5p1
    iface p5p1 inet dhcp

    # Management network
    auto p5p1:0
    iface p5p1:0 inet static
        address 10.0.0.41
        network 10.0.0.0
        netmask 255.255.255.0

    # Storage network
    auto p5p1:1
    iface p5p1:1 inet static
        address 10.0.2.41
        network 10.0.2.0
        netmask 255.255.255.0

Object1
-------

configure ``/etc/network/interfaces`` on object1
