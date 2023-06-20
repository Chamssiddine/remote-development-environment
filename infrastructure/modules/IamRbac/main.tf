resource "google_project_iam_member" "chamseddine_iam_binding" {
  project = "remotedevenv-383413"
  role    = "roles/editor"
  member  = "user:chamseddine.abderrahim@gmail.com"
}

resource "kubernetes_namespace" "chamseddine_namespace" {
  metadata {
    name = "chamseddine"
  }
}

resource "kubernetes_role" "chamseddine_role" {
  metadata {
    name      = "chamseddine-role"
    namespace = kubernetes_namespace.chamseddine_namespace.metadata[0].name
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "services", "deployments", "configmaps", "secrets", "persistentvolumeclaims", "ingresses", "jobs", "cronjobs", "replicasets", "statefulsets", "daemonsets"]
    verbs      = ["*"]
  }
}

resource "kubernetes_role_binding" "chamseddine_role_binding" {
  metadata {
    name      = "chamseddine-role-binding"
    namespace = kubernetes_namespace.chamseddine_namespace.metadata[0].name
  }

  role_ref {
    kind     = "Role"
    name     = kubernetes_role.chamseddine_role.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind     = "User"
    name     = "chamseddine.abderrahim@gmail.com"
    api_group = "rbac.authorization.k8s.io"
  }
}
