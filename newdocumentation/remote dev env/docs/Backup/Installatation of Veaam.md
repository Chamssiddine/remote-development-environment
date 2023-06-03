---
sidebar_position: 2
---

## Step 1: Create a K10 Service Account

### Create a K10 service account


```bash
myproject=$(gcloud config get-value core/project)
```

```bash
gcloud iam service-accounts create k10-sa --display-name "K10 Service Account"
```

```bash
k10saemail=$(gcloud iam service-accounts list --filter "k10-sa" --format="value(email)")
```
### Generate a key file (k10-sa-key.json)
```bash
gcloud iam service-accounts keys create --iam-account=${k10saemail} k10-sa-key.json
```

### Assign the necessary permissions to the service account for storage administration.
```bash
gcloud projects add-iam-policy-binding ${myproject} --member serviceAccount:${k10saemail} --role roles/compute.storageAdmin
```


## Step 2: Add Kasten Helm Repository and Create Namespace

Add the Kasten Helm repository to your local repository list by running the following commands:
```bash
helm repo add kasten https://charts.kasten.io/
```
Create a namespace named kasten-io where K10 will be installed by running the following commands:
```bash
kubectl create namespace kasten-io
```


## Step 3: Install Kasten K10 using Helm


Exports the contents of the k10-sa-key.json file as a base64-encoded value and assigns it to the sa_key environment variable, which can be used for authentication or configuration purposes in subsequent commands, use the following command:

```bash
export sa_key=$(base64 k10-sa-key.json)
# export sa_key=$(base64 -w0 k10-sa-key.json)
```
Install K10 in the kasten-io namespace and sets the Google API key using the contents of the base64-encoded k10-sa-key.json file by typing the following command:
```bash
helm install k10 kasten/k10 --namespace=kasten-io --set secrets.googleApiKey=$sa_key
```


## Step 4: Access Veeam Dashboard using Port Forward

To access the Veeam dashboard, execute the following command:

```sh
kubectl --namespace kasten-io port-forward service/gateway 8080:8000
```

After running this command, open your web browser and visit `http://127.0.0.1:8080/k10/#/` to access the Veeam dashboard.

For a more detailed guide, please refer to the blog post at the following [link](https://24xsiempre.com/en/how-to-install-kasten-k10-on-google-gke)



















<!-- Step 5: Get K10 Service Account Token

To obtain the K10 service account token, execute the following commands:

shell
Copy code
sa_secret=$(kubectl get serviceaccount k10-k10 -o jsonpath="{.secrets[0].name}" --namespace kasten-io)
kubectl get secret $sa_secret --namespace kasten-io -ojsonpath="{.data.token}{'\n'}" | base64 --decode
These commands retrieve the service account token, which can be used for authentication purposes. -->