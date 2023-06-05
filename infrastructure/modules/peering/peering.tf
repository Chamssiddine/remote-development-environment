# resource "google_compute_network_peering" "vpc1_to_vpc2" {
#   name                 = "vpc1-to-vpc2"
#   network              = "workstation"
#   peer_network1        = "kubernetes"
#   import_custom_routes = true
#   export_custom_routes = true
# }

# # Define VPC peering connection from VPC 2 to VPC 1
# resource "google_compute_network_peering" "vpc2_to_vpc1" {
#   name                 = "vpc2-to-vpc1"
#   network              = "kubernetes"
#   peer_network         = "workstation"
#   import_custom_routes = true
#   export_custom_routes = true
# }

variable "network_1" {
  description = "Name or identifier of the first VPC network"
  type        = string
  default = "kubernetes"
}

variable "network_2" {
  description = "Name or identifier of the second VPC network"
  type        = string
  default = "workstationvpc"
}
variable "peeringname" {
  description = "Name or identifier of the second VPC network"
  type        = string
  default = "peeringname"
}

# resource "google_compute_network_peering" "vpc1_to_vpc2" {
#   name                 = "vpc1-to-vpc2"
#   network              = google_compute_network.kubernetes.self_link
#   peer_network         = google_compute_network.workstationvpc.self_link
#   import_custom_routes = true
#   export_custom_routes = true
# }

# # Define VPC peering connection from VPC 2 to VPC 1
# resource "google_compute_network_peering" "vpc2_to_vpc1" {
#   name                 = "vpc2-to-vpc1"
#   network              = google_compute_network.workstationvpc.self_link
#   peer_network         = google_compute_network.kubernetes.self_link
#   import_custom_routes = true
#   export_custom_routes = true
# }







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









# resource "google_compute_network_peering" "peering2" {

#   name         = "peering2"
#   network      = module.workstation.google_compute_network.workstationvpc.self_link
#   peer_network = module.google_compute_network.kuberentes.self_link
# }