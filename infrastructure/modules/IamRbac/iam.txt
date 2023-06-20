locals {
  iam_bindings = {
    "chamseddine.abderrahim@gmail.com" = "roles/container.developer"
    # Add more email addresses and roles as needed
    "mahdi.bouzidi@gmail.com" = "roles/container.developer"

  }
}
resource "google_project_iam_binding" "project_binding" {
  for_each = local.iam_bindings

  project = var.gcp_project
  role    = each.value
  members = ["user:${each.key}"]
}
