resource "google_service_account" "kubernetes" {
  account_id = "chams983yd"
  project    = var.gcp_project
}

resource "google_container_node_pool" "general" {
  name       = "general"
  cluster    = google_container_cluster.primary.id
  node_count = 1
  management {
    auto_repair  = true
    auto_upgrade = true

    # cpu_utilization {
    #    target_average_utilization = 80
    # }
  }
  node_config {
    disk_size_gb = 20
    preemptible  = true
    machine_type = "e2-medium"

    #  machine_type = "c2d-highcpu-4"

    # labels = {
    #   role = "general"
    # }
    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
resource "google_container_node_pool" "spot" {
  name    = "spot"
  cluster = google_container_cluster.primary.id

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 0
    max_node_count = 10
    # cpu_utilization {
    #    target_average_utilization = 80
    # }
  }

  node_config {
    preemptible  = true // not for prod khater gcp ta5tar cheap vms w ychdou ken 24 hours
    machine_type = "e2-medium"
    # machine_type = "c2d-highcpu-4"
    disk_size_gb = 20
    # labels = {
    #   team = "devops"
    # }

    # taint {
    #   key    = "instance_type"
    #   value  = "spot"
    # effect = "NO_SCHEDULE"
    # }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
