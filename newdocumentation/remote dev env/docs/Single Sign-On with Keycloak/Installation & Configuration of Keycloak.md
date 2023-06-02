---
sidebar_position: 2
---
### 1. Navigate to the Keycloak Helm Chart directory in your Git repo:
```bash
cd helm_charts/keycloak_chart
```
### 2. Add the Codecentric Helm repo:

```bash
helm repo add codecentric 
```

### 3. Install Keycloak using the Helm Chart:

I have provided chart values that are customized for our needs, but you can make changes to suit your specific requirements. Use the following command to deploy Keycloak:

```bash
helm install keycloak codecentric/keycloak -f keycloak_values.yaml
```

That's it! Your Keycloak instance should now be up and running, you can access it with the Keycloak Service IP.