---
sidebar_position: 3
---
1. Navigate to the Prometheus chart directory:

```bash
cd helm_charts/prometheus_chart
```


2. Add the Prometheus Helm chart repository from prometheus-community:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```
3. Install Prometheus using the Helm chart. We provided the chart values customized for our needs, but you can make your changes as you wish. Specify the custom values file with -f flag:

```bash
helm install prometheus prometheus-community/prometheus -f prometheus_values.yaml --version 19.0.0
```

This will deploy Prometheus in your Kubernetes cluster using the specified configuration in values.yaml file.