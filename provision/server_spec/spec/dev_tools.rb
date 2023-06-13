require 'serverspec'

# Define the packages to be installed
packages = %w[curl wget rsync golang-go ansible vagrant ruby git]
set :backend, :exec

# Check if the packages are installed
packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end
