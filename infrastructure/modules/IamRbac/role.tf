locals {
  roles = {
    developer1 = {
      name = "developer-role"
      namespace   = "rbac"
      api_groups = [""]
      resources  = ["pods", "services", "deployments", "configmaps", "secrets", "persistentvolumeclaims", "ingresses", "jobs", "cronjobs", "replicasets", "statefulsets", "daemonsets"]
      verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
    },
    developer2 = {
      name = "viewer-role"
      namespace   = "rbac"
      api_groups = [""]
      resources  = ["pods", "services"]
      verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
    },
    # Add more roles as needed
  }
}
resource "kubernetes_namespace" "role" {

  metadata {
    # name = local.developers[each.key].namespace
    name = "role"
  }
}
resource "kubernetes_namespace" "rolebinding" {

  metadata {
    # name = local.developers[each.key].namespace
    name = "rolebinding"
  }
}
resource "kubernetes_role" "roles" {
  for_each = local.roles

  metadata {
    name      = local.roles[each.key].name
    namespace = "rbac"
  }

  dynamic "rule" {
    for_each = [local.roles[each.key]]
    content {
      api_groups = rule.value.api_groups
      resources  = rule.value.resources
      verbs      = rule.value.verbs
    }
  }
  depends_on = [ kubernetes_namespace.rolebinding, kubernetes_namespace.role ]

}
