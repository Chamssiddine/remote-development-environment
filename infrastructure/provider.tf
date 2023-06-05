terraform {
  required_version = ">=1.3"
  backend "gcs" {
    bucket = "remotedevenv"
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
      # version = "~>4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.21.0"
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
provider "kubernetes" {
  config_path = "~/.kube/config"
}