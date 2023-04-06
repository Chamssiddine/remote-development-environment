# resource "google_storage_bucket" "backend_bucket" {
#   name = "workstation-dev"
#   gcp_project = "secret-device-372619"
#   gcp_region  = "europe-west9"
#   gcp_zone    = "europe-west9-a"
#   # Bucket
#   storage-class = "STANDARD"
# }
terraform {
  required_version = ">=1.3"
  backend "gcs" {
    bucket = "workstation-dev"
    prefix = "terraform/state"
  }

}
terraform {
  required_providers {

    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~>4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.3"
    }

  }
}
provider "tls" {
  // no config needed
}
provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}
provider "helm" {
   kubernetes {
    config_path = "~/.kube/config"
  }
}
# provider "helm" {

#   host                   = module.kubernetes.google_container_cluster.primary.kube_config.0.host
#   cluster_ca_certificate = base64decode(module.kubernetes.google_container_cluster.primary.kube_config.0.cluster_ca_certificate)
#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     command     = "gcloud"
#      args = [
#         "container",
#         "clusters",
#         "get-credentials",
#         module.kubernetes.google_container_cluster.primary.name,
#         "--zone",
#         "us-central1-a",
#         "--project",
#         "secret-device-372619"
#      ]
#   }

# }
