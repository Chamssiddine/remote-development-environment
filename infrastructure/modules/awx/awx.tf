provider "awx" {
  hostname      = "http://34.121.184.170/api"
  username = var.awx_user
  password = var.awx_admin_password
  insecure = true
}


resource "awx_organization" "remote_development_environment" {
  name = "remote-development-environment"
}


resource "awx_credential" "ssh_key_credential" {
  name            = "SSH Key Credential"
  input    = filebase64("~/.ssh/del")
  credential_type_id = "Machine"
  organization_id = awx_organization.remote_development_environment.id
}


resource "awx_credential_google_compute_engine" "gce_credential" {
  name            = "GCE Credential"
  organization_id = awx_organization.remote_development_environment.id
  project = var.gcp_project
  username = ansibledyinv@remotedevenv-383413.iam.gserviceaccount.com
  ssh_key_data = filebase64("~/service/service-account.json")
}

resource "awx_inventory" "dynamic_inventory" {
  name   = "Dynamic Inventory"
  source = "google.compute.gce"
  instance_filters = {
    zone = "europe-west9-a"
  }
  credential_id   = awx_credential_google_compute_engine.gce_credential.id
  organization_id = awx_organization.remote_development_environment.id
}

resource "awx_project" "workstations" {
  name                 = "workstations"
  scm_type             = "git"
  scm_url              = "https://github.com/Chamssiddine/ansible-playbooks.git"
  scm_branch           = "main"
  scm_update_on_launch = true
  organization_id      = awx_organization.remote_development_environment.id

}


resource "awx_job_template" "env" {
  name            = "env"
  inventory_id    = awx_inventory.dynamic_inventory.id
  project_id      = awx_project.workstations.id
  playbook        = "tools/package.yaml"
  credential_id   = awx_credential_ssh_key.ssh_key_credential.id
  organization_id = awx_organization.remote_development_environment.id

}
