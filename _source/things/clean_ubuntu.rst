Clean Ubuntu
============

.. 23 mar 2016 10:23am

Cleaning up of partial package

::

	apt-get autoclean

Cleaning up of apt cache

::

	apt-get clean

Cleaning up of any unused dependancies

::

	apt-get autoremove

A good practice to avoid any left behind is to use the autoremove command whenever you want to uninstall an application

::

	apt-get autoremove application-name

Clean all junk
--------------

	To get rid of
		1. Old dependencies
		2. All downloaded packages
		#. Configuration 
		#. Old kernel

	::
	
		echo "Cleaning Up" &&
		sudo apt-get -f install &&
		sudo apt-get autoremove &&
		sudo apt-get -y autoclean &&
		sudo apt-get -y clean


