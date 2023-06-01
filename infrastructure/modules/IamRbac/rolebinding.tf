locals {
  developers = {
    roleone = {
      email     = "chamseddine.abderrahim@gmail.com"
      namespace = "chamseddine"
      role_name = "developer-role"
      # role_rules = [
      #   {
      #     api_groups = ["", "extensions", "apps"]
      #     resources  = ["*"]
      #     verbs      = ["*"]
      #   }
      # ]
    },
    roletwo = { 
      email     = "mahdi.bouzidi@gmail.com"
      namespace = "mahdi"
      role_name = "viewer-role"
      # role_rules = [
      #   {
      #     api_groups = ["", "extensions", "apps"]
      #     resources  = ["pods"]
      #     verbs      = ["get", "list", "create", "delete"]
      #   }
      # ]
    },
    # Add more developers as needed
  }
}

  # resource "kubernetes_namespace" "developers" {
  #   for_each = local.developers

  #   metadata {
  #     name = local.developers[each.key].namespace
  #   }
  # }
resource "kubernetes_role_binding" "developer_role_bindings" {
  for_each = local.developers

  metadata {
    # name      = "${local.developers[each.key].role_name}-binding"
    name      = each.key
    namespace = each.value.namespace
    # namespace = kubernetes_namespace.developers[each.key].metadata[0].name
  }

  role_ref {
    kind      = "Role"
    name      = each.value.role_name
    api_group = "rbac.authorization.k8s.io"

  }

  subject {
    kind      = "User"
    name      = local.developers[each.key].email
    api_group = "rbac.authorization.k8s.io"
  }
}



# resource "kubernetes_role" "developer_roles" {
#   for_each = local.developers

#   metadata {
#     # name      = local.developers[each.key].role_name
#     # namespace = kubernetes_namespace.developers[each.key].metadata[0].name
#     name      = each.value.role_name
#     namespace = each.value.namespace
#   }

#   rule {
#     rule       = each.value.role_rules
#     api_groups = rule.api_groups
#     resources  = rule.resources
#     verbs      = rule.verbs

#     # for rule in each.role_rules :
#     # api_groups = rule.api_groups
#     # resources  = rule.resources
#     # verbs      = rule.verbs

#   }
# }
