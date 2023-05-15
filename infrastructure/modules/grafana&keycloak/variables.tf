# ip or hostname of the keycloak server
variable "keycloak" {
  type        = string 
  description = "keycloak ip or hostname"
  default     = "http://34.71.107.34"
}
# grafana ip or hostname
variable "grafana" {
  type        = string 
  description = "grafana redirect uri ip or hostname"
  default     = "http://34.172.5.122/login/generic_oauth"
}
