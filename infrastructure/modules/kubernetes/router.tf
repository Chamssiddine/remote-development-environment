resource "google_compute_router" "router" {
  project = "secret-device-372619" #var.gcp_project #"devops-372620"  
  name    = "router"
  region  = "us-central1"
  network = google_compute_network.kubernetes.id
}