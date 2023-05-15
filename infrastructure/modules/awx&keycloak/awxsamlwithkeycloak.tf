terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "3.6.0"
    }
  }
}
# configure keycloak provider
provider "keycloak" {
  client_id = "admin-cli"
  # change the username and password according to your keycloak admin user in the variables.tf
  username  = var.admin
  password  = var.password
  #change the ip the keycloak service ip
  url                      = var.keycloak
  # if you are not using ssl
  tls_insecure_skip_verify = true
}
locals {
  realm_id       = "tower"
  awxurl         = var.awx_url
  valid_redirect = "http://34.67.39.205/sso/complete/saml"
  # should be the same as the SAML Service Provider Entity ID which can be keycloak url
  # client_id      = "http://34.71.107.34"
}

resource "keycloak_saml_client" "saml_client" {
  realm_id                  = local.realm_id
  client_id                 = var.keycloak
  name                      = "awx"
  sign_documents            = true
  sign_assertions           = true
  encrypt_assertions        = true
  include_authn_statement   = true
  client_signature_required = true
  # if it's not working try to use it as string not locals
  valid_redirect_uris       = [local.valid_redirect]

  signing_certificate = file("~/myservice.cert")
  signing_private_key = file("~/myservice.key")
}
# create mappers for user properties and attributes
resource "keycloak_saml_user_attribute_protocol_mapper" "user_permanent_id" {
  realm_id                   = local.realm_id
  client_id                  = keycloak_saml_client.saml_client.id
  user_attribute             = "uid"
  name                       = "user_permanent_id"
  friendly_name              = "name_id"
  saml_attribute_name        = "name_id"
  saml_attribute_name_format = "Basic"

}

resource "keycloak_saml_user_property_protocol_mapper" "first_name" {
  realm_id                   = local.realm_id
  client_id                  = keycloak_saml_client.saml_client.id
  name                       = "first_name"
  user_property              = "firstName"
  friendly_name              = "First Name"
  saml_attribute_name        = "first_name"
  saml_attribute_name_format = "Basic"


}

resource "keycloak_saml_user_property_protocol_mapper" "last_name" {
  realm_id                   = local.realm_id
  client_id                  = keycloak_saml_client.saml_client.id
  name                       = "last_name"
  user_property              = "lastName"
  friendly_name              = "Last Name"
  saml_attribute_name        = "last_name"
  saml_attribute_name_format = "Basic"


}

resource "keycloak_saml_user_property_protocol_mapper" "user_name" {
  realm_id                   = local.realm_id
  client_id                  = keycloak_saml_client.saml_client.id
  name                       = "user_name"
  user_property              = "username"
  friendly_name              = "User Name"
  saml_attribute_name        = "username"
  saml_attribute_name_format = "Basic"


}

resource "keycloak_saml_user_property_protocol_mapper" "email" {
  realm_id                   = local.realm_id
  client_id                  = keycloak_saml_client.saml_client.id
  name                       = "email"
  user_property              = "email"
  friendly_name              = "Email"
  saml_attribute_name        = "email"
  saml_attribute_name_format = "Basic"
}
