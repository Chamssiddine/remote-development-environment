# Remote Development Environment

The Remote Development Environment project aims to simplify and streamline the development workflow by moving it to the cloud. This eliminates the hassle and time wasted that comes with setting up a development environment manually, making it easier for new developers to join the team, with VSCode with Remote - SSH Extension, developers can easily access all necessary components of the development environment without the need for manual setup or configuration.
## Introduction

This README provides a detailed guide on how to set up and use the Remote Development Environment project. It includes information on the tools used, the cloud provider, and how to get started. It also outlines future work that is planned for the project.

## 3D Video of my Project

I used a couple of templates from **gumroad.com**

https://user-images.githubusercontent.com/62959061/229339823-0ffe29e0-6d53-4fce-87f3-a9386a8efe40.mp4

## Diagram of the project (not completed)

![remote development env](https://user-images.githubusercontent.com/62959061/229340095-12453891-b4c8-4062-82fc-60e92cac2087.png)



The following tools were used to create this project:

- **Terraform**: infrastructure as code tool
- **Helm**: Kubernetes package manager
- **Ansible**: configuration management tool
- **AWX**: web-based user interface for Ansible
- **Grafana**: open-source analytics and monitoring platform
- **Prometheus**: monitoring and alerting toolkit
- **Keycloak**: open-source identity and access management solution
- **Jenkins** (future): open-source automation server
- **ArgoCD** (future): a continuous deployment tool
- **Nexus** (future): repository manager for binary artifacts
- **Velero** (future): backup and restore tool for Kubernetes clusters
- **Vault** (future): secrets management tool
- **OLDAP** (future): LDAP server
- **Serverspec** (future): testing framework for infrastructure

## Cloud Provider:

This project was developed using **Google Cloud Platform**.


## How to Get Started

To get started with this project, follow these steps:

1. Clone the repo.
2. Install Hugo on your computer.
3. Navigate to the documentation folder and run the command `$ hugo server` to see the more detailed documentation and follow it to recreate everything.
4. Enjoy the PaperMod theme.

## The following features are planned for future development:

- SSO with Keycloak and Kubernetes to give developers access to their own dedicated and isolated namespace with RBAC and Network Policy.
- **Velero** backup solution.
- CI/CD pipeline using **Jenkins**, **Nexus**, **ArgoCD**.
- Serverspec tests.


## Things Missing in the Documentation

Currently, the documentation is missing screenshots for configuring VPC peering and SSO with Keycloak. However, Terraform files are provided, and some modifications need to be made to get Grafana with Keycloak. I'm doing our best to get the detailed documentation done, but the project is still in progress. If you have any questions, feel free to contact us at `chamssiddine.abdderrahim@etudiant-isi.utm.tn`.

## Troubleshooting

If you encounter any issues when setting up or using this project, here are a few things you can try:

Check the project's [GitHub Issues](https://github.com/Chamssiddine/remote-dev-env/issues) to see if anyone else has reported a similar problem.
Make sure you have followed all the instructions in the documentation carefully.
Double-check your configurations and make sure all required dependencies are installed.
Try restarting the necessary services or rebooting your machine.
If you are still experiencing issues, feel free to reach out to the project's maintainer(s) via the email provided in the README file.
