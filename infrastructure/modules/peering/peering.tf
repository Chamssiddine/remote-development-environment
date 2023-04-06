provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}
# # data "google_compute_network" "workstationvpc" {
# #   name = var.workstationvpc
# # }
# # data "google_compute_network" "kubernetes" {
# #   name = var.kubevpc
# # }
# locals {
#   network = { vpcone="kubernetes",vpctwo="workstationvpc"}

# }
# resource "google_compute_network_peering" "peeringvm" {

#   name               = "${var.peering_name1}"
#   network            = var.peer1_network.self_link
#   peer_network       = var.peer2_network.self_link
#   import_custom_routes = true
#   export_custom_routes = true

# }

# resource "google_compute_network_peering" "peeringkubernetes" {
#   name               = "${var.peering_name2}"
#   network            = var.peer2_network.self_link
#   peer_network       = var.peer1_network.self_link
#   import_custom_routes = true
#   export_custom_routes = true

# }

#  resource "google_compute_network_peering" "peering1" {

#   name         = "peering1"
#   network      = module.google_compute_network.kuberentes.self_link
#   peer_network = module.workstation.google_compute_network.workstationvpc.self_link
# }

  resource "google_compute_network_peering" "vpc1_to_vpc2" {
    name         = "vpc1-to-vpc2"
    network      = module.workstation.google_compute_network.workstationvpc
    peer_network = module.kubernetes.google_compute_network.kuberentes
      import_custom_routes = true
 export_custom_routes = true
  }

  # Define VPC peering connection from VPC 2 to VPC 1
  resource "google_compute_network_peering" "vpc2_to_vpc1" {
    name         = "vpc2-to-vpc1"
    network      = module.kubernetes.google_compute_network.kuberntes
    peer_network = module.workstation.google_compute_network.workstationvpc
      import_custom_routes = true
       export_custom_routes = true
  
}


# resource "google_compute_network_peering" "peering2" {

#   name         = "peering2"
#   network      = module.workstation.google_compute_network.workstationvpc.self_link
#   peer_network = module.google_compute_network.kuberentes.self_link
# }