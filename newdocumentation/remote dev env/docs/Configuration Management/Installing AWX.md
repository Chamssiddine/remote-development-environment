---
sidebar_position: 2
---
# Installing AWX
## How to install AWX using kubernetes operator
To install AWX using Kubernetes Operator, follow these steps:

### 1. Navigate to the awx-operator directory:

```bash
cd helm_charts/awx_chart/awx-operator
```

### 2. Verify the content of the following files:

:::tip
You can specify the version of AWX operator in kustomization.yaml

You can modify the specs of AWX to your needs in awx.yml.
:::




### 3. Run the kustomize command to build the Kubernetes manifest and apply it:
```bash
kustomize build . | kubectl apply -f -
```
### 3. To get the initial passowrd type in 

```bash
kubectl get secret awx-admin-password -n awx -o jsonpath="{.data.password}" | base64 --decode ; echo
```

**IMPORTANT**: It may take some time to create the pods for AWX. It will create the AWX controller manager first. If it takes longer than expected, retype the same command until you see the 4 replicas of AWX. To check if the pods are created or not, type in the following command:
```bash
kubectl get pods -n awx -w
```
