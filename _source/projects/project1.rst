Project 1: Virtical scale-up and scale-down VM resources
======================================================== 

Openstack by default does not come with vertical scaling features. You should know how to :ref:`vm_resize` to enable the feature. Openstack comes with following flavors by default and with these set of flavors you can only scale up your hardware resources and not scale down. The problem here is disk size of VM you can not decrease the size of disk. 

==========  ===============   ========== =========
Name	     Virtual cores	Memory	  Disk
==========  ===============   ========== =========
m1.tiny	        1		512 MB	  1 GB	
m1.small	1		2 GB	  20 GB	
m1.medium	2		4 GB	  40 GB	
m1.large	4		8 GB	  80 GB	
m1.xlarge	8		16 GB	  160 GB
==========  ===============   ========== =========

To solve this problem we come up with following flavours which will allow us to do vertical scale up and scale down without any problem.

===============  ===============   ========== 	=========
Name		  Virtual cores	    Memory        Disk
===============  ===============   ========== 	=========
v-scale.tiny    	1	    512 MB	  10 GB	
v-scale.small		1	    2 GB	  10 GB	
v-scale.medium		2	    4 GB	  10 GB	
v-scale.large		4	    8 GB	  10 GB	
v-scale.xlarge		8           16 GB	  10 GB
===============  ===============   ========== 	=========

In case VM runs out of disk space user can do following 

	1. Change flavor of VM with more disk space

	2. Attach additional disk using volume

Standard practice of cloud computing suggest that user should always use additional disk for VM, because in case VM fails user can detach disk from that machine and attach it to another without loss of data. Also user can extend the disk size of volume without changing flavor.

.. image:: /_images/vm_resize_problem.jpg
