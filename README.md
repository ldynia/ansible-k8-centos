This repo contains provisioning for phenex servers operated by Ansible.

### Local set up - development###

* Install [Ansible](https://www.ansible.com/)
* Install [VirtualBox](https://www.virtualbox.org/)
* Install [Vagrant](https://www.vagrantup.com/)
* Copy your local ssh key (**id_rsa.pub**) into vagrant servers
* Request sudo privileges on vagran machines

```bash
$ vagran ssh master

$ vagran ssh-config master
Host master
  IdentityFile /home/ludd/Coding/projects/phenex-provision/vagrant/.vagrant/machines/master/virtualbox/private_key

$ ssh -i /home/ludd/Coding/projects/phenex-provision/vagrant/.vagrant/machines/master/virtualbox/private_key vagrant@192.168.123.130
```

### Live set up  -production###

* Install [Ansible](https://www.ansible.com/)
* Copy your local ssh key (**id_rsa.pub**) into vagrant servers. You can use `ssh-copy-id`

### Test
Test if services is working by executing this tutorial on vagrant machines [kubernetes by example](http://kubernetesbyexample.com/services/) and running curl from each cluster node

```bash
$ vagrant up --provision
$ vagrant halt
$ vagrant destroy

$ curl CLUSTER_IP/info
```
