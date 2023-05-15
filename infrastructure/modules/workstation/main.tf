locals {
  // to add new workstation just add a new list with it's name, machine_type, your prefered os and zone
  workstations = {
  "workstation1" = { machine_type = "e2-micro", zone = "europe-west9-a", tag = ["ping", "ssh","metrics"], image = "ubuntu-2004-focal-v20230302", bucket_name = "test93345675" },  
  "workstation2" = { machine_type = "e2-micro", zone = "europe-west9-a", tag = ["ping", "ssh","metrics"], image = "ubuntu-2004-focal-v20230302", bucket_name = "test9375345657" },
  "workstation3" = { machine_type = "e2-micro", zone = "europe-west9-a", tag = ["ping", "ssh","metrics"], image = "ubuntu-2004-focal-v20230302", bucket_name = "test93753546" }
  }
}
     
resource "google_storage_bucket" "workstation-dev-station" {
  for_each      = local.workstations
  project       = var.gcp_project
  name          = each.value.bucket_name
  location      = var.gcp_region
  force_destroy = false
  storage_class = var.storage-class
  versioning {
    enabled = true
  }
}
resource "google_compute_firewall" "keycloakldap" {
  name    = "keycloakldap"
  network = google_compute_network.workstationvpc.name
  allow {
    protocol = "tcp"
    ports    = ["3000", "9090","8080","80"]
  }
  target_tags   = ["keydap"]
  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_firewall" "allowGrafanaport" {
  name    = "grafana"
  network = google_compute_network.workstationvpc.name
  allow {
    protocol = "tcp"
    ports    = ["3000", "9090","8080","80"]
  }
  target_tags   = ["grafana"]
  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_firewall" "ping" {
  name    = "ping-firewall"
  network = google_compute_network.workstationvpc.name
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080","9100", "1000-2000"]
  }

  source_tags = ["ping"]
}

resource "google_compute_firewall" "allowmetricsport" {
  name    = "metrics"
  network = google_compute_network.workstationvpc.name
  allow {
    protocol = "tcp"
    ports    = ["9100"]
  }
  target_tags   = ["metrics"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "ssh" {
  name = "alloww-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  network       = google_compute_network.workstationvpc.name
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
resource "google_compute_network" "workstationvpc" {
  name                    = "workstationvpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "wsaa-pvc-subnet" {
  name = "wsaa-pvc-subnet"
  #ip_cidr_range = "10.0.1.0/24"
  ip_cidr_range = "10.0.1.0/29"
  region        = "europe-west9"
  network       = google_compute_network.workstationvpc.id
}

resource "google_compute_instance" "workstation" {
  for_each     = local.workstations
  name         = each.key
  machine_type = each.value.machine_type
  zone         = each.value.zone
  tags         = each.value.tag

  metadata = {
    enable-oslogin = true
    # ssh-keys = "chamseddine:${file("~/.ssh/del.pub")}"

  }
  
  boot_disk {
    initialize_params {
      image = each.value.image
      labels = {
        labels = "workstation"
      }
    }
  }
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y build-essential git wget curl;"

  network_interface {
    subnetwork = google_compute_subnetwork.wsaa-pvc-subnet.id
    access_config {}
  }

#  provisioner "file" {
#     source      = "~/Downloads/factory-feat-1-create-workstations-for-developers/Infrastructure/workstation/metrics/install.sh"
#     destination = "./install.sh"
#     connection {
#       host        = "${google_compute_instance.workstation.network_interface.0.access_config.0.nat_ip}"
#       type        = "ssh"
#       user        = "yassine_hamdouni_etudiant_isi_ut"
#       private_key = file("~/.ssh/id_rsa")
#     }
#   }
#       provisioner "file" {
#     source      = "~/Downloads/factory-feat-1-create-workstations-for-developers/Infrastructure/workstation/metrics/node_exporter.service"
#     destination = "./node_exporter.service"
#     connection {
#       host        = "${google_compute_instance.workstation.network_interface.0.access_config.0.nat_ip}"
#       type        = "ssh"
#       user        = "yassine_hamdouni_etudiant_isi_ut"
#       private_key = file("~/.ssh/id_rsa")
#     }
# }
#   provisioner "remote-exec" {
#     inline = [
#       "sudo bash install.sh",
#     ]
#     connection {
#       host        = "${google_compute_instance.workstation.network_interface.0.access_config.0.nat_ip}"
#       type        = "ssh"
#       user        = "yassine_hamdouni_etudiant_isi_ut"
#       private_key = file("~/.ssh/id_rsa")
#     }
#   }

}

# resource "null_resource" "send_ssh_key" {
# depends_on = [
#   google_compute_instance.workstation
# ]
# provisioner "local-exec" {
#     command = "gcloud compute scp "
#   }
# }

# resource "null_resource" "metrics" {
# depends_on = [
#   google_compute_instance.workstation
# ]

# provisioner "local-exec" {
#     command = "bash /Users/chamseddine/Documents/github/remote-dev-env/scripts/metrics/node_exporter.bash"
#   }

# }
# resource "null_resource" "ansible_playbook" {
# depends_on = [
#   google_compute_instance.workstation
# ]
# provisioner "local-exec" {
#     command = "bash /Users/chamseddine/Documents/github/remote-dev-env/scripts/playbook/start_ansible_playbook.bash"
#   }
# }
  #   provisioner "file" {
  #   source      = "~/Downloads/factory-feat-1-create-workstations-for-developers/Infrastructure/workstation/metrics/install.sh"
  #   destination = "./install.sh"
  #   connection {
  #     host        = "${google_compute_instance.workstation[each.key].network_interface.0.access_config.0.nat_ip}"
  #     type        = "ssh"
  #     user        = "yassine_hamdouni_etudiant_isi_ut"
  #     private_key = file("~/.ssh/id_rsa")
  #   }
  # }
#       provisioner "file" {
#     source      = "~/Downloads/factory-feat-1-create-workstations-for-developers/Infrastructure/workstation/metrics/node_exporter.service"
#     destination = "./node_exporter.service"
#     connection {
#       host        = "${google_compute_instance.workstation[each.key].network_interface.0.access_config.0.nat_ip}"
#       type        = "ssh"
#       user        = "yassine_hamdouni_etudiant_isi_ut"
#       private_key = file("~/.ssh/id_rsa")
#     }
# }
#   provisioner "remote-exec" {
#     inline = [
#       "bash install.sh",
#     ]
#     connection {
#       host        = "${google_compute_instance.workstation[each.key].network_interface.0.access_config.0.nat_ip}"
#       type        = "ssh"
#       user        = "yassine_hamdouni_etudiant_isi_ut"
#       private_key = file("~/.ssh/id_rsa")
#     }
#   }
