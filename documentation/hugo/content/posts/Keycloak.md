---
title: "Keycloak"
date: 2023-01-14T14:56:27+01:00
draft: false
---

Once you're inside the git repo travel to helm chart for keycloak

<br>

  `$ cd helm_charts/keycloak_chart` 
<br>

## install helm repo from codecentric 
<<<<<<< Updated upstream

```
   helm repo add codecentric 
```

=======
```
 helm repo add codecentric 
```
>>>>>>> Stashed changes
## install keycloak using helm chart

We provided the chart values customized for our needs but you can make your changes as you wish.

To proced the deployment of keycloak type in
<<<<<<< Updated upstream

```
   helm install keycloak codecentric/keycloak -f keycloak_values.yaml
=======
```
 helm install keycloak codecentric/keycloak -f keycloak_values.yaml
>>>>>>> Stashed changes
```