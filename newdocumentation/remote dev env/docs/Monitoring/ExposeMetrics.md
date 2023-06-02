---
sidebar_position: 2
---

# Exposing Metrics for Developer VMs

To expose metrics for each developer's VM in your project, we will be using Node Exporter. We have prepared a bash script to install Node Exporter using the `gcloud` CLI and the `scp` feature.

## Navigating to the Script Folder

First, navigate to the folder where the script is located. Run the following command:

```bash
cd scripts/metrics
```

## Running the Script

The script assumes that the instances are named as `workstation1`, `workstation2`, and so on. If you have more than three instances, you will need to modify the script accordingly. Update the `for` loop to match the number of instances you have.

```bash
#!/bin/bash
for i in {1..3}
do
  gcloud compute scp install.sh workstation$i:. --zone=europe-west9-a
  gcloud compute scp node_exporter.service workstation$i:. --zone=europe-west9-a 
  gcloud compute ssh workstation$i --command='sudo bash ./install.sh'  --zone=europe-west9-a
  echo "----------Hooray! Metrics are now exposed for workstation$i----------"
done
```

The script performs the following actions:

1. Copies the `install.sh` script and `node_exporter.service` file to each workstation VM using the `gcloud compute scp` command.
2. Connects to each workstation VM using `gcloud compute ssh`.
3. Runs the `install.sh` script on each VM to install Node Exporter.
4. Displays a success message indicating that metrics are now exposed for the respective workstation.

Make sure you have the necessary permissions to execute the script and modify the zone according to your VMs' configuration.

## Conclusion

Congratulations! You have successfully set up the script to expose metrics for your developer VMs using Node Exporter. Now you can monitor and gather metrics from each workstation. If you encounter any issues or have any questions, please don't hesitate to reach out for assistance. We are here to help you!