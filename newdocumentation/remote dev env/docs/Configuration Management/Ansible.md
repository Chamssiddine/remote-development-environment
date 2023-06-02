---
sidebar_position: 4
---


# Running Ansible Playbook with Dynamic Inventory
This documentation provides a step-by-step guide on how to run an Ansible playbook with dynamic inventory on Google Cloud Platform (GCP). By the end of this guide, you should be able to transfer an SSH public key to workstations using bash scripts and run an Ansible playbook on GCP instances.
## Transferring SSH Public Key to Workstations Using Bash Scripts
To transfer an SSH public key to workstations, follow these steps:

```bash
$ cd scripts

```

this is the folders we need:
```
.
├── ansible_playbook
│   ├── README.md
│   ├── gcp.yml
│   ├── docker_playbook.yml
│   ├── packages_playbook.yml
│   └── start_ansible_playbook.bash
└── ssh
    ├── README.md
    ├── put_here_your_ssh_key_to_send.bash
    ├── remove_knowhost.bash
    └── ssh_to_workstation.bash
```


1. Remove any old known host to prevent conflicts by running the following command:

```rust
 $ rm ~/.ssh/know_hosts
```
 2. Transfer SSH Public Key to Workstations

 `IMPORTANT`: Choose the method that suits you:

        a. GCP Metadata

        b. Send machine's public key to GCP instances

3. Prepare the file to send to GCP instance by creating a new directory using the following command:

```rust
 $ mkdir ~/.ssh/auth_keys
```
4. Add the public key to the authorized_keys file using the following command:
```rust
 $ echo ~/.ssh/<publickey.pub> > ~/.ssh/auth_keys/authorized_keys
```
5. Run the following script to transfer the public key to all workstations:


```rust
 $ bash send_publickey_to_workstation.bash
```


## Running the ansible Playbook using Dynamic Inventory

**General Steps**

> 1. Create a service account.

> 2. Get the credentials JSON file.

> 3. Create the dynamic inventory file.

> 4. Run your playbook.

### 1. Create service account
To create a service account, run the following command:
```rust
 $ gcloud iam service-accounts create ansibledyinv --display-name "ansibledyinv"
```
### List the service accounts to see the service account email created

```rust
 $ gcloud iam service-accounts list
```

### Add the role to your service account email 

```rust
 $ gcloud projects add-iam-policy-binding <PROJECT_ID> --member "serviceAccount:<SERVICE_ACCOUNT_EMAIL>" --role "roles/compute.instanceAdmin.v1"
```

### 2. Export the service account key json file

```rust
$ gcloud iam service-accounts keys create /opt/ansible/inventory/service-account.json --iam-account <SERVICE_ACCOUNT_EMAIL>
```
___

### 3. Create the dynamic inventory file
To create the dynamic inventory file, navigate to the ansible_playbook directory and create a new file called gcp.yml with the following contents:
```yaml
plugin: gcp_compute
zones: # populate inventory with instances in these regions
  - europe-west9-a
projects:
  - <PROJECT_ID>
auth_kind: serviceaccount
service_account_file: /opt/ansible/inventory/service-account.json
groups:
  workstation_instances:
```

You can modify it according to your preferences, in short we will target the vm in a specific zone. 
___

### 4. Run your playbook

Choose the playbook you want to run. For example:

        A. Installing Docker.
        B. Installing multiple tools for our Developers.

4. Run the playbook using the following command:
```rust
$ ansible-playbook --user=<gcp account name> --private-key=~/.ssh/publickey.pub -i gcp.yml ThePlayBook.yml
```
Replace <gcp_account_name> with your GCP account name, and ThePlayBook.yml with the name of the playbook you want to run (e.g., docker_playbook.yml or packages_playbook.yml).

 ________
**IMPORTANT** 
 Make sure to replace 
```python
  I. <PROJECT_ID> with your actual GCP project ID
 II. <SERVICE_ACCOUNT_EMAIL> with the service account email you obtained
III. <publickey.pub> with the actual filename of your SSH public key.
```

By following these steps, you should be able to transfer the SSH public key to workstations and run your Ansible playbook using dynamic inventory on GCP instances.
