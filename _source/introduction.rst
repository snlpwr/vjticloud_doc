Introduction
============

VJTICloud is a private cloud and it is capable of providing the infrastructure and platform as a service. Infrastructure as a service includes the compute, storage and network services and platform as a service includes the operating system, middleware and runtime environment. VJTICloud is implemented using `OpenStack <https://www.openstack.org/>`__ (kilo) and Ubuntu server 14.04. 

We have build this private cloud infrastructure with minimum hardware requirements that can be used for small scale and medium scale developments. This infrastructure can be used for the deployment purposes without HA (High Availability). We can expand this architecture by adding more compute nodes and other hardware relating to performance and storage. We executed instances/virtual machines of cirros, ubuntu server, centos7, fedora-23, windows server 2012 and windows 7 for testing purpose and productivity. We can create multiple projects for multiple users under one infrastructure and admin has the power to manage them. Therefore the user can launch instances from images using particular flavor, security group, ssh key and network to deploy services. 

This OpenStack is highly beneficial for communities/organizations/institutions/research centers that do not have enough money to deploy high grade cloud services at their own place. Especially for academic institutions and Universities that don't have money and they want to have management of the resources. Like in our institute, where all departments have their own resources (hardware), websites and online storage space/web space. And even work independently and every department has to face failure and delay issues. And this model will eliminate all the issues and maintain centralized core cloud computing for maintenance. OpenStack Cloud Infrastructure is very cost effective, flexible and elastic and if any organization goes to any paid cloud providers like AWS, that organization have to pay thousands of USD as subscription charges and technical support charges. And we can implement the same kind of services using OpenStack. The main benefit of OpenStack is that it is open source and day by day it is improving, many engineers from all over the world are working on it detecting bugs, creating solutions for bugs, and making OpenStack effective.

VJTICloud currently has following services

1. :term:`Compute service`
2. :term:`Networking service`
3. :term:`Image service` 
4. :term:`Block Storage service`
5. :term:`Object Storage service`
6. :term:`Firewall`
7. :term:`Load balancer`


Current Architecture of VJTICloud
---------------------------------

.. image:: /_images/VJTICloud_arch_v2.0.png


Cloud - Mind mapping diagram
----------------------------

.. note:: Dont forget to zoom-in and zoom-out after clicking on image below. And try to navigate using arrow keys.

.. image:: /_images/coggle_cloud.png
   :scale: 50


