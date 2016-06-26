GUI in UbuntuServer
===================

.. 3rd dec, 2015 6:21pm

#. Create a instance of Ubuntu 12.04 or 14.04
#. Associate a floating IP to this machine
#. Connect via SSH (for example with putty) to the instance you started
#. Run the following commands

::

	$sudo apt-get update
	$sudo apt-get install --no-install-recommends ubuntu-desktop
	$sudo apt-get install firefox xrdp

on Ubuntu 12.04:

::

	$sudo apt-get install unity-place-applications unity-place-files

on Ubuntu 14.04:

::
	
	$sudo apt-get install unity-lens-applications unity-lens-files

5. Go to 6 unless you want to use RDP to connect and use Ubuntu 14.04 as Openstack instance.

:: 

	$sudo apt-get install xfce4
	$sudo apt-get install gnome-icon-theme-full tango-icon-theme
	$echo xfce4-session >~/.xsession

6. Because we don't know the ubuntu user password we have to reset it. Run the following command and create a password

::

	$sudo passwd ubuntu

7. We know need to reboot the instance

::
	
	$sudo reboot


