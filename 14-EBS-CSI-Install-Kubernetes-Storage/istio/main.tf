resource "helm_release" "istio" {
 
  repository          = var.helm_repository
  name = var.helm_release

  chart     = "istio"
  version   = var.chart_version
  namespace = var.helm_namespace
  timeout   = 1200

  values = [
    var.values,
  ]

  depends_on = [
    kubernetes_namespace.istio_system,
  ]
}
