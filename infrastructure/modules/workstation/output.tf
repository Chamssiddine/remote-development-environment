output "ip" {
  value = {
    for key, val in local.workstations : key => google_compute_instance.workstation[key].network_interface[0].access_config[0].nat_ip
  }
}