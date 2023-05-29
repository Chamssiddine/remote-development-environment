variable "awx_admin_password" {
  type        = string
  default     = "admin"
  description = "value of the admin password"
}
variable "awx_user" {
  type        = string
  default     = "admin"
  description = "value of the user admin"
}
variable "gcp_project" {
  type = string
  default = "remotedevenv-383413"
  description = "gcp project"
}

variable "service_account" {
  type = string
  default = ""
  
}