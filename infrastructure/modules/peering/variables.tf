# define GCP project name
variable "gcp_project" {
  type        = string
  description = "GCP project name"
  default     = "secret-device-372619"
}

# define GCP region
variable "gcp_region" {
  type        = string //europe-west9
  description = "GCP region"
  default     = "europe-west9"
}

# define GCP zone
variable "gcp_zone" {
  type        = string //a
  description = "GCP zone"
  default     = "a"
}

variable "peering_name1" {
  type        = string
  description = "The storage class of the Storage Bucket to create"
  default     = "workstationpeering"
}
variable "peering_name2" {
  type        = string //STANDARD
  description = "The storage class of the Storage Bucket to create"
  default     = "kubernetespeering"
}
variable "peer1_network" {
  type        = string //STANDARD
  description = "peer1_network"
  default     = "kuberentes"
}

variable "peer2_network" {
  type        = string //STANDARD
  description = "peer2_network"
  default     = "workstationvpc"
}