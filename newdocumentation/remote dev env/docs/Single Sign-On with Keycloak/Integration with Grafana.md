
---
sidebar_position: 4
---


## Integrate Keycloak with Grafana

### 1. Create a "grafana" Realm using Keycloak's web interface.

### 2. Navigate to the location where the Keycloak Terraform file is stored:

```bash
cd infrastructure/modules/keycloak
```
### 3. Modify the default values of the variables.tf file to match the IP or domain of your Keycloak and Grafana services:

```python
# ip or hostname of the keycloak server
variable "keycloak" {
  type        = string 
  description = "keycloak ip or hostname"
  default     = "http://<put here the ip or the domain of keycloak service>"
}
# grafana ip or hostname
variable "grafana" {
  type        = string 
  description = "grafana redirect uri ip or hostname"
  default     = "http://<put here the ip or the domain of grafana service>/login/generic_oauth"
}
```

### 4. Run the following command to create the configuration and users:

```python
terraform init
terraform apply --auto-aprouve
```

### 5. Navigate to your newly created Realm in Keycloak and add a password for your **USER** and **ADMIN**.

### 6. In Grafana_values.yaml, update the IP address in the grafana.ini section.

```yaml
# go to the line  692
grafana.ini:
  auth.generic_oauth:
      enabled: true
      name: Keycloak
      allow_sign_up: true
      scopes: profile,email,groups
      auth_url: <Keycloak service ip or domain>/auth/realms/grafana/protocol/openid-connect/auth
      token_url: <Keycloak service ip or domain>/auth/realms/grafana/protocol/openid-connect/token
      api_url: <Keycloak service ip or domain>/auth/realms/grafana/protocol/openid-connect/userinfo
      client_id: grafana
      client_secret: grafana-client-secret
      role_attribute_path: contains(groups[*], 'grafana-admin') && 'Admin' || contains(groups[*], 'grafana-dev') && 'Editor' || 'Viewer'
  server:
  # this is for grafana url
      root_url: <grafana ip or domain name>
```

### 7. Navigate back to Grafana Chart and Upgrade the changes you made 

```bash
helm upgrade grafana grafana/grafana -f grafana_values.yaml
```