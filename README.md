This repo contains provisioning for phenex servers operated by Ansible.

## Development - Local Set Up

* Install [Ansible](https://www.ansible.com/)
* Install [VirtualBox](https://www.virtualbox.org/)
* Install [Vagrant](https://www.vagrantup.com/)
* Copy your local ssh key (**id_rsa.pub**) into vagrant servers
* Request sudo privileges on vagran machines

## Production - Live Set Up

* Install [Ansible](https://www.ansible.com/)
* Copy your local ssh key (**id_rsa.pub**) into vagrant servers. You can use `ssh-copy-id`

## Vagrant

```bash
$ vagrant up
$ vagrant status
$ vagrant ssh-config

$ vagran ssh master
$ vagran ssh-config master
Host master
  IdentityFile /home/ludd/.vagrant.d/insecure_private_key

$ ssh -i /home/ludd/.vagrant.d/insecure_private_key vagrant@192.168.234.130
$ ssh -i /home/ludd/.vagrant.d/insecure_private_key vagrant@192.168.234.131
$ ssh -i /home/ludd/.vagrant.d/insecure_private_key vagrant@192.168.234.132
$ ssh -i /home/ludd/.vagrant.d/insecure_private_key vagrant@192.168.234.133

$ vagrant halt
$ vagrant destroy
```

## Ansible

```bash
$ ansible -m ping all-dev
$ ansible-playbook playbook.yml --extra-vars "deployment=production"

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


## Verify - Kubernetes Cluster
Test if services is working by executing this tutorial on vagrant machines [kubernetes by example](http://kubernetesbyexample.com/services/) and running curl from each cluster node

```bash
$ kubectl cluster-info
$ kubectl get nodes
$ kubectl get componentstatuses
```

```bash
$ vagrant up --provision
$ curl CLUSTER_IP/info
```
