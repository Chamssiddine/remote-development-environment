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

variable "storage-class" {
  type        = string //STANDARD
  description = "The storage class of the Storage Bucket to create"
  default     = "STANDARD"
}
variable "privatekeypath" {
  type    = string
  default = "~/.ssh/id_rsa"
}
variable "publickeypath" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}