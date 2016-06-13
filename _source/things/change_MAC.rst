Change/Clone MAC address of NIC
===============================

#. Login as root
#. ``# ip link set dev <interface_name> down``
#. ``# ip link set dev  <interface_name> address <new MAC address>``
#. ``# ip link set dev <interface_name> up``
#. Enjoy!!
