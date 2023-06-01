terraform {
  required_version = ">=1.3"
  backend "gcs" {
    bucket = "remotedevenv"
    prefix = "terraform/state"
  }

}
terraform {
  required_providers {
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

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}
provider "kubernetes" {
  config_path    = "~/.kube/config"
}