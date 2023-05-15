# create the service account
gcloud iam service-accounts create ansibledyinv --display-name "ansibledyinv"
# list the service accounts to see the service account email
 gcloud iam service-accounts list
# add the role to your service account email 
gcloud projects add-iam-policy-binding remotedevenv-383413 --member "serviceAccount:<SERVICE_ACCOUNT_EMAIL>" --role "roles/compute.instanceAdmin.v1"

example 

```bash
gcloud projects add-iam-policy-binding remotedevenv-383413 --member "serviceAccount:ansibledyinv@remotedevenv-383413.iam.gserviceaccount.com" --role "roles/compute.instanceAdmin.v1"
```
# export the service account key json file 

gcloud iam service-accounts keys create <KEY_FILE_NAME>.json --iam-account <SERVICE_ACCOUNT_EMAIL>


