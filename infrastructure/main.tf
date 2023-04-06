module "workstation" {

  source        = "./modules/workstation"
  gcp_project   = "secret-device-372619"
  gcp_region    = "europe-west9"
  gcp_zone      = "europe-west9-a"
  storage-class = "STANDARD"
}
output "allworkstationip" {
  value = module.workstation.ip
}
module "kubernetes" {
  source      = "./modules/kubernetes"
  gcp_project = "secret-device-372619"
  gcp_region  = "europe-west9"
  gcp_zone    = "europe-west9-a"

}
output "k8sclustersname" {
  value = module.kubernetes.k8sclustername
}
# module "helm_release" {
#   source = "./modules/helm"
# }
# module "peering" {
#   # depends_on = [
#   #   module.kubernetes.google_compute_network.kubernetes,
#   #   module.workstation.google_compute_network.workstationvpc
#   # ]
#   source         = "./modules/peering"
#   gcp_project    = "secret-device-372619"
#   gcp_region     = "europe-west9"
#   gcp_zone       = "europe-west9-a"
# }

# module "peering" {
#   source = "./modules/peering"


# }