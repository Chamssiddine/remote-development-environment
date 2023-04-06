#!/bin/bash
echo "[workstation]" > /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/hosts
gcloud compute instances list --format='get(networkInterfaces[0].accessConfigs[0].natIP)' >> /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/hosts
ansible-playbook -i /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/hosts --user=yassine_hamdouni_etudiant_isi_ut --private-key=~/.ssh/id_rsa /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/packages_playbook.yml
#ansible-playbook -i /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/hosts --user=yassine_hamdouni_etudiant_isi_ut 
--private-key=~/.ssh/id_rsa /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/docker_playbook.yml
