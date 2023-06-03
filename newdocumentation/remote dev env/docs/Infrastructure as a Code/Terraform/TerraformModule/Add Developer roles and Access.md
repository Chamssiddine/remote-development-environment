---
sidebar_position: 4
---
To add a new developer and role binding, as well as a new role, navigate to `infrastructure/modules/IamRbac` follow these steps:

1. Add a new developer:
   - Open the Terraform configuration file `rolebinding.tf`.
   - Locate the `developers` local block.
   - Add a new entry within the `developers` block, specifying the details of the new developer, such as their email address, namespace, and desired role.
   - Uncomment and customize the `role_rules` if you want to specify custom rules for the developer's role.
   - Save the file.


```python
locals {
  developers = {
    roleone = {
      email     = "chamseddine.abderrahim@gmail.com"
      namespace = "chamseddine"
      role_name = "developer-role"
    },
    roletwo = { 
      email     = "mahdi.bouzidi@gmail.com"
      namespace = "mahdi"
      role_name = "viewer-role"
    },
    newdeveloper = { 
      email     = "newdeveloper@gmail.com"
      namespace = "newnamespace"
      role_name = "newrole"
    },
    # Add more developers as needed
  }
}
```

2. Add a new role:
   - Open the Terraform configuration file `role.tf`.
   - Locate the `roles` local block.
   - Add a new entry within the `roles` block, specifying the details of the new role, such as its name, API groups, resources, and verbs.
   - Save the file.


```python
locals {
  roles = {
    developer1 = {
      name = "developer-role"
      api_groups = [""]
      resources  = ["pods", "services", "deployments", "configmaps", "secrets", "persistentvolumeclaims", "ingresses", "jobs", "cronjobs", "replicasets", "statefulsets", "daemonsets"]
      verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
    },
    developer2 = {
      name = "viewer-role"
      api_groups = [""]
      resources  = ["pods", "services"]
      verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
    },
    newrole = {
      name = "new-role"
      api_groups = [""]
      resources  = ["deployments", "configmaps"]
      verbs      = ["get", "list", "create"]
    },
    # Add more roles as needed
  }
}
```

3. Update the IAM bindings:
   - Open the Terraform configuration file `iam.tf`.
   - Locate the `iam_bindings` local block.
   - Add a new entry within the `iam_bindings` block, associating the email address of the new developer with their desired role.
   - Save the file.


```python
locals {
  iam_bindings = {
    "chamseddine.abderrahim@gmail.com" = "roles/container.developer"
    "mahdi.bouzidi@gmail.com" = "roles/container.developer"
    "newdeveloper@gmail.com" = "roles/container.viewer"  # Assigning the new developer to an existing role
  }
}
```

4. Run `terraform plan` and `terraform apply` in the ROOT Module to apply the changes and create the new developer, role binding, and role.
:::danger IMPORTANT
Ensure that you have the necessary permissions and credentials to make changes to the IAM bindings and roles.
:::
:::tip NOTE
Please adapt the code examples to match your existing naming conventions and specific requirements.
:::