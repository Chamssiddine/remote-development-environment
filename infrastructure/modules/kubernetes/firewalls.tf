resource "google_compute_firewall" "allow-ssh" {
  project = var.gcp_project #"secret-device-372619" # var.gcp_project #"devops-372620"  
  name    = "allow-ssh"
  network = google_compute_network.kubernetes.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_firewall" "allow-prometheus" {
  project = var.gcp_project #"secret-device-372619" # var.gcp_project #"devops-372620"  
  name    = "allow-prometheus"
  network = google_compute_network.kubernetes.name
  allow {
    protocol = "tcp"
    ports    = ["32340"]
  }
  source_ranges = ["0.0.0.0/0"]
}