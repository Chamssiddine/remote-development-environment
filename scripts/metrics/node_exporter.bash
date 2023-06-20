#!/bin/bash
# Generate the list of instances with zone europe-west9-a
instances=$(gcloud compute instances list --filter="zone:(europe-west9-a)" --format="value(name)")
for instance in $instances; do
  gcloud compute scp ~/Documents/github/remote-development-environment/scripts/metrics/install.sh $instances:. --zone=europe-west9-a
  gcloud compute scp ~/Documents/github/remote-development-environment/scripts/metrics/node_exporter.service $instances:. --zone=europe-west9-a 
  gcloud compute ssh $instances --command='sudo bash ./install.sh'  --zone=europe-west9-a
  echo "----------horray my metrics are exposed---------- "
done