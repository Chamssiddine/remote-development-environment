require 'serverspec'
require 'google/apis/compute_v1' 

gcp_credentials = '~/service/service-account.json'
set :backend, :gcp
set :gcp_project_id, 'remotedevenv-383413'
set :gcp_credentials, gcp_credentials
set :gcp_metadata_filter, 'zone:(europe-west9-a)'

set :sudo_options, '-E -H -S'
set :backend, :jexec

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
