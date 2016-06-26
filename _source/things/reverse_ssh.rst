SSH reverse tunneling
=====================

**Source:** server1 [Public IP]

**Destination:** Any local address inside NAT e.g. 192.168.0.100

#. SSH from the destination to source (with public ip) using following command

	::

		ssh -R 14322:localhost:22 user@server1

#. Now you can SSH from source to destination through ssh tunneling

	::

		ssh localhost -p 14322

#. Anyone who can log into server1 can also access 192.168.0.100 through server1 e.g.

	::

		ssh user@server1
		ssh localhost -p 14322
