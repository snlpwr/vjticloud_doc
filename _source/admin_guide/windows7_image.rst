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

   .. image:: /_images/win7_custom_install.png

   Choose “Custom (advanced)”

   .. image:: /_images/win7_browse_folder.png

   Select “Load Driver”

   .. image:: /_images/win7_load_driver.png

   Navigate to the CD Drive with the VirtIO drivers. For the Windows 7 64bit version you need to select the “WIN7” -> “AMD64” directory. Click “OK”

   .. image:: /_images/win7_select_driver.png

   Select the listed drivers (one for the Ethernet Adapter and one for the Hard Disk Controller). Click “Next”.

   Now you should be able to select the prepared image file as the disk for the installation.

   The second step of the installation where you need to be careful is when you have to insert the Windows product key.

   .. image:: /_images/win7_licence.png   

   This step is not crucial. You do not have to insert the product key right now. Windows will run for 30 days without product key. So it could be handy to insert the product key and activate Windows when the installation is completely done and Windows is running on OpenStack without troubles.

   Click on “Skip”.

   Finish the installation, but do not install the updates right away. You will do that on OpenStack.

#. Image is complete

   The underlying image file that you created further up with the shell command qemu-img create, such as ~/image/win7_sp1_x64_en_vlk.qcow2 is now ready for uploading to the OpenStack Image Service.

   **Upload image**

   At that point the image should be about 8GB big for Windows 7. That image can now be uploaded to OpenStack. There are mainly 2 ways to do that; either by the OpenStack Dashboard or the CLI-client. The size of Windows images can grow rapidly. After an update you might end with a size of 17GB. We had problems to upload big images, so try out both upload method.

   **OpenStack Dashboard**

   To upload the image you can login to the dashboard, switch to “Images” and click on the “+ create Image” button.


