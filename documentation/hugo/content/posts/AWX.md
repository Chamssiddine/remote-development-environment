---
title: "AWX"
date: 2023-01-17T14:56:04+01:00
draft: false
---

# How to install Awx using kubernetes operator

## First thing you need to go in this directory 
 <br /> 

`$ cd helm_charts/awx_chart/awx-operator`
 <br />   
  <br />  
## Second verify the content of

```
  kustomization.yaml 
  awx.yml 
```    
- You can specify the version of awx operator in the first file
- You can modify the specs of awx to your needs  <br /> <br /> <br />
<br />
 <br />
## Lastly run the kustomize command
 <br /> 

`$ kustomize build . | kubectl apply -f -`