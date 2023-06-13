# this does work
require 'net/ssh'

hosts = %w[34.155.174.214 34.163.141.145 34.155.143.82]
ssh_user = 'chamssiddine_abderrahim_etudiant'
ssh_key = '~/.ssh/del'

hosts.each do |host|
  Net::SSH.start(host, ssh_user, keys: [ssh_key]) do |ssh|
    puts "Connected to #{host}"

    # Execute your desired commands here
    result = ssh.exec!("sudo systemctl status docker")
    puts result

    ssh.close
  end
end
# ________________________________________________________________


# require 'serverspec'
# require 'net/ssh'

# # Replace `chamssiddine_abderrahim_etudiant` and `~/.ssh/del` with your own values
# ssh_user = 'chamssiddine_abderrahim_etudiant'
# ssh_key = '~/.ssh/del'
# set :backend, :exec

# hosts = %w[34.155.174.214 34.163.141.145 34.155.143.82]

# hosts.each do |host|
#   describe "Docker on #{host}" do
#     let(:ssh) { Net::SSH.start(host, ssh_user, keys: [ssh_key]) }

#     describe package('docker-ce') do
#       it { should be_installed }
#     end

#     describe package('docker-ce-cli') do
#       it { should be_installed }
#     end

#     describe package('containerd.io') do
#       it { should be_installed }
#     end

#     describe service('docker') do
#       it { should be_enabled }
#       it { should be_running }
#     end

#     after(:each) do
#       ssh.close
#     end
#   end
# end
