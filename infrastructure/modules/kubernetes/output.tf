output "k8sclustername" {
  description = "The name of the cluster master. This output is used for interpolation with node pools, other modules."
  value = google_container_cluster.primary.name
}