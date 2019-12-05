Linux installation on Fedora 30
===============================

When using Vagrant on Linux one can either use libvirt/KVM or VirtualBox.

libvirt advantages: supported by default, no 3rd party software needed

libvirt disadvantages: the Vagrant libvirt provider is not as developed as the VirtualBox provider. This can come into play as not all Vagrant Boxes are supported in libvirt, there are many more Vagrant plugins for VirutalBox, and as of Oktober 2019 libvirt VM's can't use local storage for an unprivileged user, which would be the ideal way to use Vagrant.

VirtualBox advantages: It is the supported provider by Vagrant, and hence likely to work the best with Vagrant. Far more Vagrant Boxes are supported. The provider have many more options for manipulating the Vagrant machines.

VirtualBox disadvanges: Not part of the standard (Fedora 30) package repository. Can be installed from RPMFusion.

Install Vagrant and Ansible
---------------------------

```bash
dnf -y install vagrant vagrant-sshfs ansible vim-syntastic-ansible
```


Using libvirt
-------------

```bash
dnf -y install vagrant-libvirt

dnf -y install bridge-utils libvirt virt-install qemu-kvm
lsmod | grep kvm
dnf -y install virt-top libguestfs-tools
systemctl start libvirtd
systemctl enable libvirtd
usermod --append --groups libvirt <USERNAME-HERE>

# Redefine libvirt storage pool path
# Workaround. The storage is still owned as root, which is not ideal.
virsh pool-list
virsh pool-destroy default
virsh pool-undefine default
mkdir /home/libvirt-storage
virsh pool-define-as --name default --type dir --target /home/libvirt-storage
virsh pool-autostart default
virsh pool-start default
virsh pool-list
```

As root list libvirt networks by `virsh net-list`.

No need to create a new network bridge. Can just use `virbr0`. A good how to would however be: https://www.cyberciti.biz/faq/how-to-add-network-bridge-with-nmcli-networkmanager-on-linux/

To list and delete downloaded Vagrant Boxes
```Bash
virsh vol-list default
virsh vol-delete centos-VAGRANTSLASH-7_vagrant_box_image_1905.1.img default
virsh pool-refresh default
```

Using VirtualBox
----------------
```bash
dnf -y install VirtualBox kmod-VirtualBox virtualbox-guest-additions
```
To edit default storage location `virutalbox`-> Preferences.
