#!/bin/bash
instances=$(gcloud compute instances list --filter="zone:(europe-west9-a)" --format="value(name)")
for instance in $instances; do
  echo ------sending publickey key sent to $instances------
  # ------ or you can send the authorized_keyfile from your local machine to your instances ------
  gcloud compute ssh $instances --command='mkdir ~/.ssh' --zone=europe-west9-a
  gcloud compute scp ~/.ssh/auth_keys/authorized_keys $instances:~/.ssh --zone=europe-west9-a
  echo ------public key sent to $instances------


  # ------ or you can create the folder and copy and paste your key public and echo it in the authorized_keys as it is ------
  # gcloud compute ssh $instances --command='mkdir ~/.ssh;echo putHereYourSshKey> ~/.ssh/authorized_keys' --zone=europe-west9-a
done