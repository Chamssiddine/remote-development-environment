---
title: "Prometheus"
date: 2023-01-14T14:56:27+01:00
draft: false
---

Once you're inside the git repo travel to helm chart for Prometheus


```
cd helm_charts/prometheus_chart

```


## install helm repo from codecentric 
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```
## install Prometheus using helm chart

We provided the chart values customized for our needs but you can make your changes as you wish.

To proced the deployment of Prometheus type in

```
helm install prometheus prometheus-community/prometheus -f values.yaml

<<<<<<< HEAD
```
=======
```
>>>>>>> main
