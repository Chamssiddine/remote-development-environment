# define GCP project name
variable "gcp_project" {
  type        = string // workstation-375011
  description = "GCP project name"
  default     = "remotedevenv-383413"
}
variable "gcp_zone" {
  type        = string // europe-west9-a
  description = "GCP zone"
  default     = "europe-west9-a"
  
}