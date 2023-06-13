#!/bin/bash
# echo "[workstation]" > /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/hosts
# gcloud compute instances list --format='get(networkInterfaces[0].accessConfigs[0].natIP)' >> /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/hosts
# ansible-playbook -i /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/hosts --user=chamssiddine_abderrahim_etudiant --private-key=~/.ssh/del /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/packages_playbook.yml
#ansible-playbook -i /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/hosts --user=chamssiddine_abderrahim_etudiant --private-key=~/.ssh/id_rsa /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/docker_playbook.yml

ansible-playbook --user=chamssiddine_abderrahim_etudiant --private-key=~/.ssh/del -i gcp.yml packages_playbook.yml