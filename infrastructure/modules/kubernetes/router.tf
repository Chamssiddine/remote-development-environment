resource "google_compute_router" "router" {
  project = var.gcp_project #
  name    = "router"
  region  = "us-central1"
  network = google_compute_network.kubernetes.id
}