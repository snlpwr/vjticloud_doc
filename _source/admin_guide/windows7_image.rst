How to create Windows 7 cloud image
===================================
.. https://blog.zhaw.ch/icclab/windows-image-for-openstack/

#. On 64 bit Ubuntu install following tools
   ::

	$ sudo apt-get update
	$ sudo apt-get install qemu-system-x86
	$ sudo apt-get install qemu-kvm
	$ sudo apt-get install virt-manager
	$ sudo apt-get install libvirt-bin libvirt-doc

#. Store your windows 7 and virtio driver ISO from where we can mount them to VM.

#. Create the container file

   ::

	$ mkdir ~/image
	$ cd ~/image  
	$ qemu-img create -f qcow2 win7_sp1_x64_en_vlk.qcow2 20G

#. Start the VM

   ::

	$ sudo kvm -m 2048 -drive file=~/iso/windows_7_professional.iso,index=1,media=cdrom \
	-drive file=~/image/win7_sp1_x64_en_vlk.qcow2,if=virtio \
	-drive file=~/iso/virtio-win-0.1-74.iso,index=3,media=cdrom \
	-net nic,model=virtio \
	-net user \
	-nographic \
	-vnc :9 -usbdevice tablet\

   That command will start a VM with following settings:

	-m 2048: 
		Does allocate the memory size of the VM
    	-drive file=~/iso/windows_7_professional.iso,index=1,media=cdrom:
		The VM will have a virtual CD-ROM drive attached containing the Windows 7 iso (will act like a normal Windows 7 installation CD/DVD)

	-drive file=~/iso/virtio-win-0.1-74.iso,index=3,media=cdrom:
		The VM will have a virtual CD-ROM drive attached containing the VirtIO iso

	-drive file=~/image/win7_sp1_x64_en_vlk.qcow2,if=virtio: 
		The VM will have a virtual hard disk attached which will use the image file we just created as storage and the VirtIO drives as a storage interface

	-net nic,model=virtio -net user: 
		Sets the VirtIO driver for the network interface card (nic) with a user-mode network stack that bridges to the host’s network

	-nographic: 
		Disables graphical output

	-vnc :9: 
		Enables VNC on port 5909

	-usbdevice tablet: 
		Use an USB tablet instead of the default PS/2 mouse. Recommend, because the tablet sends the mouse cursor’s position to match the host mouse cursor.


#. VNC-Connection

   Use a VNC-Client to connect to your new VM (on Ubuntu you can use Remmina, which is part of the distribution). The server is reachable on the server address: localhost:5909.

   The first one is while choosing the type of installation. You need to do a custom installation, which allows you to install the VirtIO drivers.