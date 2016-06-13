Mount USB drive in Linux/Ubuntu
===============================


.. 11 sept 2015 2:57pm

#. To check usb device name

	:: 

	$sudo fdisk -l

#. Create a mount point

	::
	
	$sudo mkdir /media/usb

#. Mount

	::

	$sudo mount /dev/sdb1 /media/usb

#. Unmount 

	::
	
	$umount /media/usb
