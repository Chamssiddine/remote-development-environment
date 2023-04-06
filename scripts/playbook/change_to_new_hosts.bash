#!/bin/bash
echo "[workstation]" > hosts
gcloud compute instances list --format='get(networkInterfaces[0].accessConfigs[0].natIP)' >> hosts
