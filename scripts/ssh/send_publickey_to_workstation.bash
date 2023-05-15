#!/bin/bash
for i in {1..3}
do
  echo ------sending publickey key sent to workstation$i------
  # ------ or you can send the authorized_keyfile from your local machine to your instances ------
  gcloud compute ssh workstation$i --command='mkdir ~/.ssh' --zone=europe-west9-a
  gcloud compute scp ~/.ssh/auth_keys/authorized_keys workstation$i:~/.ssh --zone=europe-west9-a
  echo ------public key sent to workstation$i------


  # ------ or you can create the folder and copy and paste your key public and echo it in the authorized_keys as it is ------
  # gcloud compute ssh workstation$i --command='mkdir ~/.ssh;echo putHereYourSshKey> ~/.ssh/authorized_keys' --zone=europe-west9-a
done