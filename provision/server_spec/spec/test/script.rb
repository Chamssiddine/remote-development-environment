
require 'serverspec'
require 'net/ssh'
require 'sshkit'
require 'sshkit/dsl'

host = '34.155.174.214'
key_path = '~/.ssh/del'
user = 'chamssiddine_abderrahim_etudiant'

puts "Host: #{host}"
puts "SSH Key Path: #{File.expand_path(key_path)}"

Net::SSH.start(host, user, keys: [File.expand_path(key_path)], forward_agent: true) do |ssh|
  @ssh_session = ssh
end
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