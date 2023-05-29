# Get the credentials 


resource "null_resource" "get-credentials" {
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials primary --zone us-central1-a --project remotedevenv-383413"
  }
}

# deploy keycloak chart using helm

resource "helm_release" "keycloak" {
  depends_on = [null_resource.get-credentials]
  name       = "keycloak"
  #namespace  = "keycloak"
  repository = "https://codecentric.github.io/helm-charts" //https://codecentric.github.io/helm-charts
  chart      = "keycloak"
  # version    = ""
  values = [
       "${file("./modules/helm/values/keycloak_values.yaml")}"
  ]
}
# deploy prometheus chart using helm

resource "helm_release" "prometheus" {
  depends_on = [null_resource.get-credentials]
  name       = "prometheus"
  # namespace  = "default"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-community"
  version    = "22.6.0"
  values = [
       "${file("./modules/helm/values/prometheus_values.yaml")}"
  ]
}
# deploy grafana chart using helm
resource "helm_release" "grafana" {
  depends_on = [null_resource.get-credentials]
  name       = "grafana"
  # namespace  = "test"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "6.56.4"
  values = [
    "${file("./modules/helm/values/grafana_values.yaml")}"
  ]
}
