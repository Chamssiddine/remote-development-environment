# resource "google_dns_managed_zone" "example_com_zone" {
#   name        = "keycloakchamshoss.com"
#   dns_name    = "keycloakchamshoss.com."
#   description = "Managed zone for example.com domain"
# }
# resource "google_dns_record_set" "example_com_record" {
#   name    = "keycloakchamshoss.com."
#   type    = "A"
#   ttl     = 300
#   managed_zone = google_dns_managed_zone.example_com_zone.name
#   rrdatas = ["${google_compute_global_address.keycloak_lb_ip.address}"]
# }
# Get the credentials 


resource "null_resource" "get-credentials" {
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials primary --zone us-central1-a --project secret-device-372619"
  }
}

# deploy keycloak chart using helm

# resource "helm_release" "keycloak" {
#   depends_on = [null_resource.get-credentials]
#   name       = "keycloak"
#   #namespace  = "keycloak"
#   repository = "https://codecentric.github.io/helm-charts" //https://codecentric.github.io/helm-charts
#   chart      = "keycloak"
#   #version    = ""
#   set {
#     name  = "service.type"
#     value = "LoadBalancer"
#   }
#   set {
#     name  = "ingress.enabled"
#     value = "true"
#   }

#   set {
#     name  = "auth.adminUser"
#     value = var.keycloakuser
#   }

#   set {
#     name  = "auth.adminPassword	"
#     value = var.keycloakpassword
#   }
# }
# resource "kubernetes_ingress" "keycloak" {
#   depends_on = [
#     helm_release.keycloak
#   ]
#   metadata {
#     name = "keycloak-ingress"
#   }

#   spec {
#     rule {
#       host = "keycloakchamshoss.com"

#       http {
#         path {
#           path = "/"

#           backend {
#             service_name = "keycloak"
#             service_port = 8080
#           }
#         }
#       }
#     }
#   }
# }
# deploy prometheus chart using helm

resource "helm_release" "prometheus" {
  depends_on = [null_resource.get-credentials]
  name       = "prometheus"
  # namespace  = "default"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  #version    = ""
  set {
    name  = "service.type"
    value = "ClusterIP"
  }
  values = [
    "${file("~/Documents/github/remote-dev-env/infrastructre/modules/kubernetes/values.yaml")}"
  ]
  set {
    name  = "service.targets"
    value = "ClusterIP"
  }
}
# deploy grafana chart using helm
resource "helm_release" "grafana" {
  depends_on = [null_resource.get-credentials]
  name       = "grafana"
  # namespace  = "test"


  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "8.3.3"
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "adminPassword"
    value = var.grafanapassword
  }
}
