#!/bin/bash

# Update package list
apt-get update
# Install python3
apt-get install -y python3
# Install required dependencies
apt-get install -y apt-transport-https ca-certificates gnupg

# Add Google Cloud SDK repository
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
grep -rhE ^deb /etc/apt/sources.list* | grep "cloud-sdk"
# Import Google Cloud public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Update package list and install Google Cloud SDK
apt-get update
apt-get install -y google-cloud-sdk

# Optional: Install additional components
apt-get install kubectl
apt-get install google-cloud-sdk-gke-gcloud-auth-plugin

# apt-get install -y google-cloud-cli-anthos-auth
# apt-get install -y google-cloud-cli-app-engine-go
# apt-get install -y google-cloud-cli-app-engine-java
# ...
gcloud components install gke-gcloud-auth-plugin
# Optional: Run gcloud init to configure the SDK
# gcloud init

echo "Google Cloud SDK installed successfully!"
