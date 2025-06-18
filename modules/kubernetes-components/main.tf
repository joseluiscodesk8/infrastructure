resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "8.1.0" # Usa la última versión estable

  values = [file("${path.module}/resources/argocd-values.yaml")] 
  depends_on = [kubernetes_namespace.argocd]
}

