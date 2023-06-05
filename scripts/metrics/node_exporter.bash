#!/bin/bash
for i in {1..3}
do
  gcloud compute scp ~/Documents/github/remote-development-environment/scripts/metrics/install.sh workstation$i:. --zone=europe-west9-a
  gcloud compute scp ~/Documents/github/remote-development-environment/scripts/metrics/node_exporter.service workstation$i:. --zone=europe-west9-a 
  gcloud compute ssh workstation$i --command='sudo bash ./install.sh'  --zone=europe-west9-a
  echo "----------horray my metrics are exposed---------- "
done