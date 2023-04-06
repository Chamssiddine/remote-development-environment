# GCP instances can have different IP@

so the temporary solution is to create a script that create hosts file with the ip@ of all gcp 
instances we have to run this cmd:
 $ bash change_to_new_hosts.bash

 of course you need to specify your private key and your public key in the VMs

 $ start_ansible_playbook.bash docker_playbook.yml 
 $ start_ansible_playbook.bash packages_playbook.yml 