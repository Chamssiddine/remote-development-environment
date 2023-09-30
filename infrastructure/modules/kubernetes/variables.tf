# define GCP project name
variable "gcp_project" {
  type        = string // 
  description = "GCP project name"
  default     = "caramel-vine-393909"
}

# define GCP region
variable "gcp_region" {
  type        = string //europe-west9
  description = "GCP region"
  default     = "us-central1"
}

# define GCP zone
variable "gcp_zone" {
  type        = string //a
  description = "GCP zone"
  default     = "a"
}
variable "grafanapassword" {
  type        = string //password
  description = "the password for grafana consol"
  default     = "grafanaadmin"
}
variable "keycloakpassword" {
  type        = string //password
  description = "the password for grafana consol"
  default     = "admin"
}
variable "keycloakuser" {
  type        = string //password
  description = "the password for grafana consol"
  default     = "admin"
}
variable "bucket-name" {
  type        = string //storage
  description = "The name of the Google Storage Bucket to create"
  default     = "storage"
}

variable "storage-class" {
  type        = string //STANDARD
  description = "The storage class of the Storage Bucket to create"
  default     = "STANDARD"
}