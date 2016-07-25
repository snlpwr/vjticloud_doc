Set default username and password for ubuntu cloud image
========================================================

::

	#cloud-config
	password: mypassword
	chpasswd: { expire: False }
	ssh_pwauth: True
