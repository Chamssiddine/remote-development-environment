# ip or hostname of the keycloak server
variable "keycloak" {
  type        = string
  description = "keycloak ip or hostname"
  default     = "http://35.202.182.80"
}
variable "admin" {
  type        = string
  description = "admin user of keycloak"
  default     = "admin"
}

variable "password" {
  type        = string
  description = "the password of the admin user of keycloak"
  default     = "admin"
}

variable "awx_url" {
  type        = string
  description = "put in the url of the awx server"
  default     = "http://35.238.48.77"
}

variable "valid_redirect_uris" {
  type = string
  description = "put in the redirect uri of the awx server typically http://<awxserverip>/sso/complete/saml"
  default     = "http://35.238.48.77/sso/complete/saml"
}