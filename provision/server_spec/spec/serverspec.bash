#!/bin/bash

# Generate the list of instances with zone europe-west9-a
instances=$(gcloud compute instances list --filter="zone:(europe-west9-a)" --format="value(name)")

# Path to the docker_spec.rb file
spec_file="docker_spec.rb"
dev_tools="dev_tools.rb"
# Copy docker_spec.rb to each instance and run the tests
for instance in $instances; do
  echo "Copying docker_spec.rb and dev_tools to $instance..."
  gcloud compute scp $spec_file $instance:~/ --zone=europe-west9-a
  gcloud compute scp $dev_tools $instance:~/ --zone=europe-west9-a

  echo "Installing Serverspec on $instance..."
  # SSH into the instance and install Serverspec
  gcloud compute ssh $instance --zone=europe-west9-a --command="sudo gem install serverspec >/dev/null && sudo gem install serverspec | tail -n 2"

  echo "Running tests on $instance..."
  # SSH into the instance and run the tests, suppressing the warning message
  gcloud compute ssh $instance --zone=europe-west9-a --command="sudo rspec ~/docker_spec.rb --format documentation"
  gcloud compute ssh $instance --zone=europe-west9-a --command="sudo rspec ~/dev_tools.rb   --format documentation"

  echo "Cleaning up docker_spec.rb and dev_tools on $instance..."
  # Remove the copied docker_spec.rb file from the instance
  gcloud compute ssh $instance --zone=europe-west9-a --command="rm ~/docker_spec.rb ~/dev_tools.rb"
done
