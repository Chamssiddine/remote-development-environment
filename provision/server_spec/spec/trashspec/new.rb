require 'serverspec'
require 'google/api_client'
require 'net/ssh'

gcp_credentials = '~/service/workstation.json'
project_id = 'remotedevenv-383413'
local_spec_file = '~/Documents/github/remote-development-environment/provision/server_spec/spec/docker_spec.rb'
remote_spec_file = '/tmp/docker_spec.rb'

set :backend, :ssh
set :ssh_options, {
  user: 'chamssiddine_abderrahim_etudiant',
  keys: ['~/.ssh/del'],
  forward_agent: true,
  auth_methods: ['publickey']
}

# Initialize the GCP client using your service account credentials
credentials = Google::Cloud::Compute::Credentials.new gcp_credentials

gcp = Google::Cloud::Compute.new project: project_id, credentials: credentials

# Retrieve the list of instances in your project
instances = gcp.instances

# Loop over the instances and transfer the spec file, then execute the tests remotely via SSH
instances.each do |instance|
  # Get the IP address of the instance
  ip_address = instance.public_ip

  # Skip instances without a public IP address
  next unless ip_address

  # Set the current instance as the target host for Serverspec
  set :host, ip_address

  # Transfer the spec file to the remote machine using SCP
  Net::SCP.upload!(ip_address, 'chamssiddine_abderrahim_etudiant', local_spec_file, remote_spec_file, ssh: { keys: ['~/.ssh/del'], forward_agent: true })

  # Execute the tests remotely via SSH
  Net::SSH.start(ip_address, 'chamssiddine_abderrahim_etudiant', keys: ['~/.ssh/del'], forward_agent: true) do |ssh|
    result = ssh.exec!("sudo rspec #{remote_spec_file}")
    puts result
  end
end
