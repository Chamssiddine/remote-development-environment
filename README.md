# Remote Development Environment
My project aims to move all development work flow to the cloud and eliminate the hustle and time wasted that comes with setting your development environment 
manually which facilitates the integration of new developers to the teams, you will only need VSCODE with Remote - SSH Extention.
## 3D Video of my Project

I used a couple of templates from **gumroad.com**

https://user-images.githubusercontent.com/62959061/229339823-0ffe29e0-6d53-4fce-87f3-a9386a8efe40.mp4

## Diagram of the project (not completed)

![remote development env](https://user-images.githubusercontent.com/62959061/229340095-12453891-b4c8-4062-82fc-60e92cac2087.png)

## Tools used :
* **Terraform**
* **Helm**
* **Ansible**
* **AWX**
* **Grafana**
* **Prometheus**
* **Keycloak**


## Cloud Provider:

* Google Cloud Platform

## How to Get Started

1. After cloning the repo install hugo on your computer 
2. go the documentation folder and run the command to see the mode detailed documentation and follow it to recreate everything

`$ hugo server`

3. enjoy the PaperMod Theme <3

## Tools will be used in the future:
* **Jenkins**
* **Nexus**
* **Velero**
* **Vault**
* **OLDAP**
* **Serverspec**
* **ArgoCD**

## things in the work

For the time being I'm working on SSO with keycloak and kubernetes to give developers the access to their own dedicated and isolated namespace with RBAC and Network Policy, next I will see about Velero backup solution, I will add the CI/CD part later on along with Serverspec tests

## Things Missing in the Documentation

I didn't provide screenshots to configure VPC peering, as well as the SSO configuration (I only did AWX and grafana with keycloak), however there are terraform files and some modification need to be made to get grafana with keycloak, I'm trying my best to get the detailed doc done but the project is HUGE haha if you have any question send me an email

`
chamssiddine.abdderrahim@etudiant-isi.utm.tn
`
