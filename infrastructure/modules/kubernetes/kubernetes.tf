# locals {
#   // 
#   developers = {
#     "developer1" = { namespace = "chams", name = "devc", label = "stage" },
#     "developer2" = { namespace = "houssem", name = "devh", label = "test" },
#     "developer3" = { namespace = "aziz", name = "deva", label = "prod" }
#   }
# }
resource "google_container_cluster" "primary" {
  project                  = "secret-device-372619"
  name                     = "primary"
  location                 = "us-central1-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.kubernetes.self_link
  subnetwork               = google_compute_subnetwork.private.self_link
  logging_service          = "logging.googleapis.com/kubernetes"
  monitoring_service       = "monitoring.googleapis.com/kubernetes"
  networking_mode          = "VPC_NATIVE"
  # Optional, if you want multi-zonal cluster
  node_locations = [
    "us-central1-b"
  ]
  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }
  release_channel {
    channel = "REGULAR"
  }
  workload_identity_config {
    workload_pool = "secret-device-372619.svc.id.goog"
  }
  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }


}

# Get the credentials 
resource "null_resource" "get-credentials" {

  depends_on = [google_container_cluster.primary]

  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials primary --zone us-central1-a --project secret-device-372619"
  }
}

# provider "helm" {
#   kubernetes {
#         config_path = "~/.kube/config"
#     # host                   = google_container_cluster.primary.endpoint
#     # cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
#     # exec {
#     #   api_version = "client.authentication.k8s.io/v1beta1"
#     #   command     = "kubectl"
#     #   args        = ["container", "clusters", "get-credentials", google_container_cluster.primary.name]
#     #   env         = {
#     #     GOOGLE_APPLICATION_CREDENTIALS = "~/path/credentialsgcp/service.json"
#     #   }
#     # }
#   }
# }
# output "cluster_ready" {
#   value = "${can(kubernetes_ready, true)}"
#   depends_on = [google_container_cluster.primary]
# }


# deploy keycloak chart using helm

# resource "helm_release" "keycloak" {
#   depends_on = [null_resource.get-credentials]
#   name       = "keycloak"
#   #namespace  = "keycloak"
#   repository = "https://charts.bitnami.com/bitnami"
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
#     name  = "ingress.hostname"
#     value = "keycloak.remotedevenv.com"
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
# # deploy prometheus chart using helm

# resource "helm_release" "prometheus" {
#   depends_on = [null_resource.get-credentials]
#   name       = "prometheus"
#   # namespace  = "default"
#   repository = "https://prometheus-community.github.io/helm-charts"
#   chart      = "prometheus"
#   #version    = ""
#   set {
#     name  = "service.type"
#     value = "ClusterIP"
#   }
#     values = [
#     "${file("modules/kubernetes/values.yaml")}"
#   ]
#    set {
#     name  = "service.targets"
#     value = "ClusterIP"
#   }
# }
# # deploy grafana chart using helm
# resource "helm_release" "grafana" {
#   depends_on = [null_resource.get-credentials]
#   name       = "grafana"
#   # namespace  = "test"


#   repository = "https://grafana.github.io/helm-charts"
#   chart      = "grafana"
#   #version    = "8.3.3"
#   set {
#     name  = "service.type"
#     value = "LoadBalancer"
#   }

#   set {
#     name  = "adminPassword"
#     value = var.grafanapassword
#   }
# }
