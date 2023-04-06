#!/bin/bash
for i in {1..3}
do
  gcloud compute ssh workstation$i --command='mkdir ~/.ssh;echo putHereYourSshKey> ~/.ssh/authorized_keys' --zone=europe-west9-a

# ------ or you can send the authorized_keyfile from your local machine to your instances ------

 # gcloud compute scp authorized_keys workstation$i:~/.ssh --zone=europe-west9-a
 #gcloud compute scp /Users/chamseddine/Documents/github/remote-dev-env/scripts/ssh/authorized_keys workstation$i:~/.ssh --zone=europe-west9-a

done