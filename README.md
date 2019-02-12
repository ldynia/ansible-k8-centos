This repo contains provisioning for phenex servers operated by Ansible.

## Local set up - development###

* Install [Ansible](https://www.ansible.com/)
* Install [VirtualBox](https://www.virtualbox.org/)
* Install [Vagrant](https://www.vagrantup.com/)
* Copy your local ssh key (**id_rsa.pub**) into vagrant servers
* Request sudo privileges on vagran machines

```bash
$ vagran ssh master

$ vagran ssh-config master
Host master
  IdentityFile /home/ludd/.vagrant.d/insecure_private_key

$ ssh -i /home/ludd/.vagrant.d/insecure_private_key vagrant@192.168.123.130
$ ssh -i /home/ludd/.vagrant.d/insecure_private_key vagrant@192.168.123.131
$ ssh -i /home/ludd/.vagrant.d/insecure_private_key vagrant@192.168.123.132
$ ssh -i /home/ludd/.vagrant.d/insecure_private_key vagrant@192.168.123.133
```

## Live set up  -production###

* Install [Ansible](https://www.ansible.com/)
* Copy your local ssh key (**id_rsa.pub**) into vagrant servers. You can use `ssh-copy-id`

## Test
Test if services is working by executing this tutorial on vagrant machines [kubernetes by example](http://kubernetesbyexample.com/services/) and running curl from each cluster node

```bash
$ vagrant up --provision
$ curl CLUSTER_IP/info
```

## Vagrant

```bash
$ vagrant up --provision
$ vagrant halt
$ vagrant destroy
```

## Ansible

```bash
# CLI
$ ansible -vvvv -m ping all-dev
$ ansible -vvvv -m shell -a 'hostname' all-dev
$ ansible -vvvv -m shell -a 'df -h' all-dev
$ ansible -vvvv -m shell -a 'whoami' all-dev
$ ansible -u vagrant -m shell -a 'sudo yum-complete-transaction --cleanup-only' all-dev

# PLAYBOOK
$ ansible-playbook -K -s -u vagrant playbook.yml  
$ ansible-playbook --ask-sudo-pass --user=vagrant playbook.yml
```
