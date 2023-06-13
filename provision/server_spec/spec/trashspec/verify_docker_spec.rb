require 'serverspec'
require 'net/ssh'
require 'sshkit'
require 'sshkit/dsl'

set :backend, :ssh
set :ssh_options, {
  user: 'chamssiddine_abderrahim_etudiant',
  keys: ['~/.ssh/del'],
  forward_agent: true,
  auth_methods: ['publickey']
}

# Retrieve the list of GCP instances in the desired zone and extract their public IP addresses
hosts = `gcloud compute instances list --format='value(networkInterfaces[0].accessConfigs[0].natIP)' --filter='zone:europe-west9-a'`.split("\n")

key_path = '~/.ssh/del'
user = 'chamssiddine_abderrahim_etudiant'

puts "Host: #{host}"
puts "SSH Key Path: #{File.expand_path(key_path)}"
# Verify Docker installation and status on each host
hosts.each do |host|
  describe "Docker on #{host}" do
    before :all do
      Net::SSH.start(host, user, keys: [File.expand_path(key_path)], forward_agent: true) do |ssh|
        # @ssh_session = ssh
        result = ssh.exec!("ls -l")
        puts result
      end
    end

    # after :all do
    #   @ssh_session.close
    # end

    describe package('docker-ce') do
      it { should be_installed }
    end

    describe package('docker-ce-cli') do
      it { should be_installed }
    end

    describe package('containerd.io') do
      it { should be_installed }
    end

    describe service('docker') do
      it { should be_enabled }
      it { should be_running }
    end
  end
end
