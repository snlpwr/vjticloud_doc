Openstack CLI
=============

#. Login to controller

#. Export variable required for openstack 
   ::

	$ source admin-openrc.sh 

#. To check compute services run following command
   ::

	$ nova service-list 
	+----+------------------+------------+----------+----------+-------+----------------------------+-----------------+
	| Id | Binary           | Host       | Zone     | Status   | State | Updated_at                 | Disabled Reason |
	+----+------------------+------------+----------+----------+-------+----------------------------+-----------------+
	| 1  | nova-cert        | controller | internal | enabled  | up    | 2016-07-03T19:58:49.000000 | -               |
	| 2  | nova-consoleauth | controller | internal | enabled  | up    | 2016-07-03T19:58:49.000000 | -               |
	| 3  | nova-scheduler   | controller | internal | enabled  | up    | 2016-07-03T19:58:49.000000 | -               |
	| 4  | nova-conductor   | controller | internal | enabled  | up    | 2016-07-03T19:58:49.000000 | -               |
	| 7  | nova-compute     | compute1   | mumbai   | enabled  | up    | 2016-07-03T19:58:44.000000 | -               |
	| 8  | nova-compute     | compute2   | nova     | enabled  | up    | 2016-07-03T19:58:43.000000 | -               |
	| 9  | nova-compute     | compute3   | nova     | enabled  | up    | 2016-07-03T19:58:44.000000 | -               |
	| 10 | nova-compute     | compute4   | nova     | disabled | down  | 2016-06-16T13:45:22.000000 | -               |
	+----+------------------+------------+----------+----------+-------+----------------------------+-----------------+

#. To check network services run following command
   ::

	$ neutron agent-list 
	+--------------------------------------+--------------------+----------+-------+----------------+---------------------------+
	| id                                   | agent_type         | host     | alive | admin_state_up | binary                    |
	+--------------------------------------+--------------------+----------+-------+----------------+---------------------------+
	| 23ad1d72-1ecb-4af7-8cd5-11b583291df7 | Metadata agent     | network  | :-)   | True           | neutron-metadata-agent    |
	| 6f714e1d-580e-4f1e-81d3-2a741abae580 | Open vSwitch agent | compute4 | xxx   | True           | neutron-openvswitch-agent |
	| 76937820-8a62-4b67-a8fb-1c45eda80b99 | Loadbalancer agent | network  | :-)   | True           | neutron-lbaas-agent       |
	| 7c4d2b0e-b5f4-48ce-a464-605ed954e83b | L3 agent           | network  | :-)   | True           | neutron-l3-agent          |
	| 7dc682a7-1c30-440d-a846-03606d10563c | DHCP agent         | network  | :-)   | True           | neutron-dhcp-agent        |
	| ab60d440-b0ba-46bb-93c1-0067597c0629 | Open vSwitch agent | network  | :-)   | True           | neutron-openvswitch-agent |
	| b9ee4d26-39a8-4e22-809a-e6605172ded9 | Open vSwitch agent | compute1 | :-)   | True           | neutron-openvswitch-agent |
	| cfc6eeb5-265a-4685-8504-9ce7f89da4aa | Open vSwitch agent | compute3 | :-)   | True           | neutron-openvswitch-agent |
	| ea6593ca-0274-44eb-9387-f3dcd082d87c | Open vSwitch agent | compute2 | :-)   | True           | neutron-openvswitch-agent |
	+--------------------------------------+--------------------+----------+-------+----------------+---------------------------+
#. To check block storage services run following command
   ::

	$ cinder service-list 
	+------------------+------------+------+---------+-------+----------------------------+-----------------+
	|      Binary      |    Host    | Zone |  Status | State |         Updated_at         | Disabled Reason |
	+------------------+------------+------+---------+-------+----------------------------+-----------------+
	| cinder-scheduler | controller | nova | enabled |   up  | 2016-07-03T20:02:48.000000 |       None      |
	|  cinder-volume   | block1@lvm | nova | enabled |   up  | 2016-07-03T20:02:47.000000 |       None      |
	+------------------+------------+------+---------+-------+----------------------------+-----------------+
#. To get the list of hypervisors
   :: 

	$ nova hypervisor-list 
	+----+---------------------+-------+----------+
	| ID | Hypervisor hostname | State | Status   |
	+----+---------------------+-------+----------+
	| 1  | compute1            | up    | enabled  |
	| 2  | compute2            | up    | enabled  |
	| 3  | compute3            | up    | enabled  |
	| 4  | compute4            | down  | disabled |
	+----+---------------------+-------+----------+
#. To get details of specified hypervisor
   ::

	$ nova hypervisor-show compute1
	+---------------------------+---------------------------------------------------------+
	| Property                  | Value                                                   |
	+-------------------------------------------------------------------------------------+
	| cpu_info_arch             | x86_64                                                  |
	| cpu_info_features         | ["pge", "avx", "clflush", "sep", "syscall",             |
	|                           |     "vme", "dtes64", "invpcid", "tsc", "fsgsbase",      |
	|                           |     "xsave", "vmx", "erms", "xtpr", "cmov", "smep",     |
	|                           |     "ssse3", "est", "pat", "monitor", "pcid", "lm",     |
	|                           |     "msr", "nx", "fxsr", "tm", "sse4.1", "pae",         |
	|                           |     "sse4.2", "pclmuldq", "acpi", "fma",                |
	|                           |     "tsc-deadline", "mmx", "osxsave", "cx8", "mce",     |
	|                           |     "de", "tm2", "ht", "pse", "lahf_lm", "abm",         |
	|                           |     "popcnt", "mca", "pdpe1gb", "apic", "sse",          |
	|                           |     "f16c", "ds", "invtsc", "pni", "rdtscp", "avx2",    |
	|                           |     "aes", "sse2", "ss", "ds_cpl", "bmi1", "bmi2",      |
	|                           |     "pbe", "fpu", "cx16", "pse36", "mtrr", "movbe",     |
	|                           |     "pdcm", "rdrand", "x2apic"]                         |
	| cpu_info_model            | SandyBridge                                             |
	| cpu_info_topology_cores   | 4                                                       |
	| cpu_info_topology_sockets | 1                                                       |
	| cpu_info_topology_threads | 1                                                       |
	| cpu_info_vendor           | Intel                                                   |
	| current_workload          | 0                                                       |
	| disk_available_least      | 84                                                      |
	| free_disk_gb              | 166                                                     |
	| free_ram_mb               | 6192                                                    |
	| host_ip                   | 10.0.0.31                                               |
	| hyper^isor_hostname       | compute1                                                |
	| hypervisor_type           | QEMU                                                    |
	| hypervisor_version        | 2002000                                                 |
	| id                        | 1                                                       |
	| local_gb                  | 219                                                     |
	| local_gb_used             | 53                                                      |
	| memory_mb                 | 15920                                                   |
	| memory_mb_used            | 9728                                                    |
	| running_vms               | 4                                                       |
	| ser^ice_disabled_reason   | -                                                       |
	| service_host              | compute1                                                |
	| service_id                | 7                                                       |
	| state                     | up                                                      |
	| status                    | enabled                                                 |
	| vcpus                     | 4                                                       |
	| vcpus_used                | 5                                                       |
	+---------------------------+---------------------------------------------------------+

#. To get list of servers belonging to specific hypervisor
   ::
	$ nova hypervisor-servers compute1
	+--------------------------------------+-------------------+---------------+---------------------+
	| ID                                   | Name              | Hypervisor ID | Hypervisor Hostname |
	+--------------------------------------+-------------------+---------------+---------------------+
	| c90dd8cb-c79c-49d1-ae86-4cc6393fde54 | instance-0000015c | 1             | compute1            |
	| bb1aaf65-dee7-4cf9-a24f-35c286918c91 | instance-000001a4 | 1             | compute1            |
	| 999e9455-f733-44a2-922e-c27f2a5eefe3 | instance-000001cd | 1             | compute1            |
	| c165ee2c-e8d3-433a-99df-b5160e55e076 | instance-000001cf | 1             | compute1            |
	+--------------------------------------+-------------------+---------------+---------------------+
	$ nova hypervisor-servers compute2
	+--------------------------------------+-------------------+---------------+---------------------+
	| ID                                   | Name              | Hypervisor ID | Hypervisor Hostname |
	+--------------------------------------+-------------------+---------------+---------------------+
	| 6f04c1ca-3619-4120-a762-9e034ffa2956 | instance-00000160 | 2             | compute2            |
	| 837bfdba-f9f0-40d9-a0ef-bc5eb2a1a662 | instance-0000019f | 2             | compute2            |
	| d95330bb-457c-4aad-b279-464c5d3fc3e2 | instance-000001a6 | 2             | compute2            |
	| 1921f26b-be71-46fb-8b51-41361c38d50e | instance-000001d0 | 2             | compute2            |
	+--------------------------------------+-------------------+---------------+---------------------+
	$ nova hypervisor-servers compute3
	+--------------------------------------+-------------------+---------------+---------------------+
	| ID                                   | Name              | Hypervisor ID | Hypervisor Hostname |
	+--------------------------------------+-------------------+---------------+---------------------+
	| 1407e576-74b5-4349-8c29-7c304486132c | instance-0000015b | 3             | compute3            |
	| 4b5df26b-59fd-4bd1-9bb4-9d4b2e01be95 | instance-000001ce | 3             | compute3            |
	| 7d5bc7db-45ff-4928-a9a9-fbbf81d08b90 | instance-000001e4 | 3             | compute3            |
	| 48bb9ad9-7e04-4b83-9fae-4e976e8ad8fa | instance-000001e5 | 3             | compute3            |
	| eeb5cca3-5d4e-4882-9fac-af7fa958ece4 | instance-000001e6 | 3             | compute3            |
	| 1d3f305f-d1f0-493e-aab2-6a3ac96fa440 | instance-000001e8 | 3             | compute3            |
	+--------------------------------------+-------------------+---------------+---------------------+

#. To get network list
   ::

	$ nova net-list 
	+--------------------------------------+-------------+------+
	| ID                                   | Label       | CIDR |
	+--------------------------------------+-------------+------+
	| 1064eacc-dfee-408b-8df7-83bee1d97bd1 | admin-net   | None |
	| 16dc5485-da61-4255-81dc-567f0c041699 | LBaaS-Net   | None |
	| 2e101f3f-1ddc-4bec-b570-10c5a68e67f3 | demo-net    | None |
	| 7005ef25-145b-43f1-b21a-2f1142fb9d79 | V-Scale-Net | None |
	| a4df784e-c568-45ec-8743-6c213d34f477 | student-net | None |
	| db9d5ce2-661c-48b2-b370-61c3446b552b | VJTINet     | None |
	+--------------------------------------+-------------+------+
#. To get flavor list
   ::

	$ nova flavor-list 
	+--------------------------------------+--------------+-----------+------+-----------+------+-------+-------------+-----------+
	| ID                                   | Name         | Memory_MB | Disk | Ephemeral | Swap | VCPUs | RXTX_Factor | Is_Public |
	+--------------------------------------+--------------+-----------+------+-----------+------+-------+-------------+-----------+
	| 1d956c07-da89-44ee-a9c9-1492387e1750 | sunil.xlarge | 16384     | 40   | 0         |      | 8     | 1.0         | True      |
	| 59cc7770-4664-4b9e-a563-11a4f54b4493 | sunil.large  | 8144      | 20   | 0         |      | 4     | 1.0         | True      |
	| 64baffac-5f88-4e3f-ac45-e01f64519e45 | sunil.tiny   | 512       | 1    | 0         |      | 1     | 1.0         | True      |
	| 96718d93-dd86-4cdf-b6e0-d6f62a2ad72f | sunil.small  | 1024      | 5    | 0         |      | 1     | 1.0         | True      |
	| b6b10b1e-2e49-4855-b727-d0fe1955fae5 | sunil.medium | 4096      | 10   | 0         |      | 2     | 1.0         | True      |
	+--------------------------------------+--------------+-----------+------+-----------+------+-------+-------------+-----------+
#. To get floating ip list
   ::

	$ nova floating-ip-list 
	+--------------------------------------+---------------+--------------------------------------+----------------+---------+
	| Id                                   | IP            | Server Id                            | Fixed IP       | Pool    |
	+--------------------------------------+---------------+--------------------------------------+----------------+---------+
	| 21411450-76a6-4a7e-a118-b6093a4d3f55 | 172.18.38.199 | 1407e576-74b5-4349-8c29-7c304486132c | 192.168.100.47 | VJTINet |
	| 56075bc8-4697-4617-aa9b-f0f7be41eb23 | 172.18.38.200 | c90dd8cb-c79c-49d1-ae86-4cc6393fde54 | 192.168.100.48 | VJTINet |
	| d84fd38b-a08f-4f67-8999-bbf27c8735b1 | 172.18.38.103 | 6f04c1ca-3619-4120-a762-9e034ffa2956 | 192.168.100.52 | VJTINet |
	| d9813c02-d75c-4e19-b9ab-90ad4786456c | 172.18.38.102 | 837bfdba-f9f0-40d9-a0ef-bc5eb2a1a662 | 192.168.100.64 | VJTINet |
	| e6ac1a33-6218-4044-97f9-35ea01df27f6 | 172.18.38.116 | bb1aaf65-dee7-4cf9-a24f-35c286918c91 | 192.168.100.67 | VJTINet |
	+--------------------------------------+---------------+--------------------------------------+----------------+---------+

