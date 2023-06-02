---
sidebar_position: 3
---

## Module Purpose

GKE Cluster Module

## Deploying the Kubernetes Cluster
To deploy our Kubernetes cluster, you'll need to navigate to the kubernetes Terraform module by running the following command:
```
$ cd infrastructure/modules/kubernetes
```
Next, you'll need to apply the Terraform file using the following command:

```yaml
$ terraform apply

```
This will deploy the necessary infrastructure on your cloud provider (e.g. Google Cloud Platform) and provision the Kubernetes cluster.

## Customizing the Kubernetes Cluster
If you'd like to customize the Kubernetes cluster, you can modify the default variables in the variable.tf file. This file contains all the configurable variables for the Terraform module.

Once you've made the necessary changes, you can re-run the terraform apply command to apply the changes to the Kubernetes cluster.


## Exploring the Kubernetes Cluster
Congratulations, you've successfully deployed the Kubernetes cluster! Now, you can explore the features of the cluster using tools like kubectl.

There are many other commands you can use to explore and manage the Kubernetes cluster. We recommend checking out the official Kubernetes documentation for more information.

That's it for this guide.

<!-- type the variable asked for the kubernetes cluster -->