resource "google_project_service" "compute" {
  service                    = "compute.googleapis.com"
  project                    = var.gcp_project #
  disable_on_destroy         = false
  disable_dependent_services = false
}

resource "google_project_service" "container" {
  service                    = "container.googleapis.com"
  project                    = var.gcp_project #
  disable_on_destroy         = false
  disable_dependent_services = false
}
resource "google_compute_network" "kubernetes" {
  project                         = var.gcp_project #
  name                            = "kubernetes"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

  # depends_on = [
  #   google_project_service.compute,
  #   google_project_service.container
  # ]
}
