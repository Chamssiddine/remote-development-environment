---
sidebar_position: 3
---
import ReactPlayer from 'react-player'

# How to Integrate Keycloak with AWX

### 1. Navigate to setttings on AWX -> Miscellaneous System settings

### 2. Edit Base URL of the service to your base URL or IP

### 3. Go back to Settings, then SAML settings and replace the fields as shown below:
### `SAML Service Provider Entity ID`

```ruby
https://keycloakdomainname
```

###  `SAML Service Provider Public Certificate`

###  `SAML Service Provider Private Key`

### Generate a certificate and Public key by typing in :
```bash
openssl req -new -x509 -days 3650 -nodes -out saml.crt -keyout saml.key
```

 **`SAML Service Provider Organization Info:`**
```yaml
{
  "en-US": {
    "url": "http://keycloakserviceip",
    "name": "keycloak",
    "displayname": "keycloak"
  }
}
```

**``` Specify SAML Service Provider Technical Contact:```**
```yaml
{
  "emailAddress": "chamseddine.abderrahim@gmail.com",
  "givenName": "chamseddine"
}
```
** `Specify Service Provider Support Contact:`**
```yaml
{
  "emailAddress": "chamseddine.abderrahim@gmail.com",
  "givenName": "chamseddine"
}
```

** `Specify SAML Enabled Identity Provider:`**
```yaml
{
  "keycloak": {
    "x509cert": "certificatewithoutbreakinglines",
    "attr_first_name": "first_name",
    "attr_email": "email",
    "url": "http://keycloakserviceip/auth/realms/tower/protocol/saml",
    "attr_user_permanent_id": "name_id",
    "entity_id": "http://keycloakserviceip/auth/realms/tower",
    "attr_groups": "groups",
    "attr_last_name": "last_name",
    "attr_username": "username"
  }
}
```

** `Specify SAML Organization Map:`**
```yaml
{
  "Default": {
    "users": true
  },
  "Systems Engineering": {
    "remove_users": false,
    "remove_admins": false,
    "users": true,
    "admins": [
      "chamseddine.abderrahim@gmail.com"
    ]
  }
}
```

<div className="video__wrapper">
    <ReactPlayer className="video__player" controls height="100%" url="/awxsettingstochange.mov" width="100%" />
</div>

### Verify your Configuration by typing this command and upload it to keycloak when creating your client: 

```bash
curl -k -L http://AwxServiceIP/sso/metadata/saml/ > awx-keycloak.xml
```

## Keycloak Side

 **`Create Your REALM named: tower`**

 **`Import the "awx-keycloak.xml" to your REALM`**

<div className="video__wrapper">
    <ReactPlayer className="video__player" controls height="100%" url="/createrealminkeycloak.mov" width="100%" />
</div>


** `Add Your certificate and Private key to your REALME `**
<div className="video__wrapper">
    <ReactPlayer className="video__player" controls height="100%" url="/keycloakawxone.m4v" width="100%" />
</div>


**`Add Mappers for the saml request nagivate to infrastructure/modules/awxsaml and type in:`**
:::danger Important
Change the variable values inside variables.tf file to match your service URL etc....
:::
```python
terraform init
terraform apply
```



**`Verify the SSO is working`**
<div className="video__wrapper">
    <ReactPlayer className="video__player" controls height="100%" url="/verifyeverythingandtestsso.m4v" width="100%" />
</div>