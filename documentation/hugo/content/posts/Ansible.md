---
title: "Ansible"
date: 2023-01-18T14:55:57+01:00
draft: false
---

# Run Ansible Playbook

For the time being we will use bash scripts to play our playbook, so we have a couple of bash scripts to fix some problems with ssh connection due to terraform not working as it should, the key folder structure is:



│──── playbook<br />  
    ├── README.md<br />  
    ├── change_to_new_hosts.bash<br />  
    ├── copy_ansible_playbook_to_workstations.bash<br />  
    ├── docker_playbook.yml<br />  
    ├── hosts<br />  
    ├── packages_playbook.yaml<br />  
    └── start_ansible_playbook.bash<br />  
│──── ssh_scripts<br />  
    ├── README.md<br />  
    ├── authorized_keys<br />  
    ├── remove_knowhost_beforeanything.bash<br />  
    ├── send_my_ssh_key_to_workstation.bash<br />  
    └──  ssh.bash<br />  

* we neet to transfer our public keys to each of the workstation, so we run these cmd in order
we will remote any old know host to prevent any conflict:

 `$ bash remove_knowhost_beforeanything.bash`<br />  
<br />  
we will create .ssh folder and send the file authorized_keys which contain our public key for all the 3 VMs we have or send echo the key to the file :

 `$ bash send_my_ssh_key_to_workstation.bash`

* Last part is play the ansible playbook, we have two for the time being one is for installing docker and the other one is for installing multiple tools for our developers.
we will create the hosts file with the new Publis IP of the VMs <br />  <br />  
 `$ bash change_to_new_hosts.bash`
<br />  
<br />  

* Afterward we run the playbooks for all the VMs
 <br /> 
 <br />  

 `$ bash start_ansible_playbook.bash`
 ________

NOTE: if you want to not use ssh and cp the playbook inside the vm and run it locally of course change the playbook you want to copy

 `$ bash copy_ansible_playbook_to_workstations.bash`

 
```
 bash copy_ansible_playbook_to_workstations.bash

```
