Proxy Settings
==============

Set Proxy
---------

1. Using file ``/etc/apt/apt.conf`` in Ubuntu/Debian based linux

	::

		Acquire::http::proxy "http://username:password@proxyserver:port/";
		Acquire::https::proxy "https://username:password@proxyserver:port/";
		Acquire::ftp::proxy "ftp://username:password@proxyserver:port/";

2. Using export command on any linux

	::

		export http_proxy=http://username:password@proxyserver:port/ 
		export https_proxy=https://username:password@proxyserver:port/

Unset Proxy
-----------

1. Remove or rename ``/etc/apt/apt.conf`` file.

2. Run following commands

	::

		unset http_proxy
		unset https_proxy

