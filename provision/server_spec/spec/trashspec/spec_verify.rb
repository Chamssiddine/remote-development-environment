require 'googleauth'
require 'google/apis/compute_v1'

describe 'GCP Instances' do
  before(:all) do
    # Set up the Google Cloud API client
    scopes = ['https://www.googleapis.com/auth/cloud-platform']
    credentials = Google::Auth.get_application_default(scopes)
    @compute = Google::Apis::ComputeV1::ComputeService.new
    @compute.authorization = credentials
    @project = 'remotedevenv-383413'
  end
  before(:all) do
    # Load the JSON credentials from the file
    credentials = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open('opt/ansible/inventory/service-account.json'),
      scope: 'https://www.googleapis.com/auth/cloud-platform'
    )
    credentials.fetch_access_token!

    # Set up the Google Cloud API client
    @compute = Google::Apis::ComputeV1::ComputeService.new
    @compute.authorization = credentials
    @project = 'remotedevenv-383413'
  end
  it 'should exist' do
    instance_name = 'workstation1'
    machine_type = 'e2-micro'

    # Verify that the GCP instance exists and has the correct machine 
type
    instance = @compute.get_instance(@project, 'europe-west9-a', 
instance_name)
    expect(instance.machine_type).to include(machine_type)
  end
end

# Check if 
# describe package('python3') do
#   it { should be_installed }
#   its('version') { should cmp >= '3.0' }
# end

# # Check if Java is installed and its version is correct
# describe package('openjdk-11-jdk') do
#   it { should be_installed }
#   its('version') { should cmp >= '11.0' }
# end

# # Check if Terraform is installed and its version is correct
# describe command('terraform -v') do
#   its('exit_status') { should eq 0 }
#   its('stdout') { should match (/Terraform v\d+\.\d+\.\d+/) }
# end

# # Check if Vagrant is installed and its version is correct
# describe package('vagrant') do
#   it { should be_installed }
#   its('version') { should cmp >= '2.0' }
# end

# # Check if Docker is installed and its version is correct
# describe package('docker-ce') do
#   it { should be_installed }
#   its('version') { should cmp >= '18.09' }
# end

# Check if Docker service is running
describe service('docker') do
  it { should be_installed }
  it { should be_running }
end
