GIT proxy settings
==================

.. 180120160518PM

Set git proxy
-------------

	::
	
		git config --global http.proxy http://proxyuser:proxypwd@proxy.server.com:8080
		git config --global https.proxy https://proxyuser:proxypwd@proxy.server.com:8080

	Change following, 
		| ``proxyuser`` to your proxy user
		| ``proxypwd`` to your proxy password
		| ``proxy.server.com`` to the URL of your proxy server
		| ``8080`` to the proxy port configured on your proxy server

Unset git proxy
---------------

	::

		git config --global --unset http.proxy
		git config --global --unset https.proxy

	To check the currently set proxy

	::

		git config --global --get http.proxy
		git config --global --get https.proxy
