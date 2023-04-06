terraform {
  required_version = ">=1.3"
  # backend "gcs" {
  #   bucket = "workstation-dev" //-gsb
  #   prefix = "terraform/statelesx"
  # }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>4.0"
    }
    helm = {
      source = "hashicorp/helm"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.0.3"
    }
  }

}
# provider "helm" {
#    kubernetes {
#     # config_path = "~/.kube/config"
#   }
# }