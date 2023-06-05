locals {
  developers = {
    roleone = {
      email     = "chamseddine.abderrahim@gmail.com"
      namespace = "chamseddine"
      role_name = "developer-role"
    },
    roletwo = { 
      email     = "mahdi.bouzidi@gmail.com"
      namespace = "mahdi"
      role_name = "viewer-role"
   
    },
    # Add more developers as needed
  }
}

  resource "kubernetes_namespace" "rolebindingdevelopers" {
    for_each = local.developers

    metadata {
      name = local.developers[each.key].namespace
    }
  }
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
  depends_on = [ kubernetes_namespace.rolebindingdevelopers ]
}

