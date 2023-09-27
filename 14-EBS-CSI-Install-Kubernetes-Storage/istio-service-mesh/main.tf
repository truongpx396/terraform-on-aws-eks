resource "helm_release" "istio" {
 
  repository          = var.helm_repository
  chart     = "istiod"

  name = "istio"

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

resource "helm_release" "istio-ingressgateway" {
 
  repository          = var.helm_repository
  chart     = "gateway"

  name = "istio-ingressgateway"

  version   = var.chart_version
  namespace = var.helm_namespace
  timeout   = 1200

  set {
    name  = "service.type"
    value = "NodePort"
  }


  # values = [
  #   var.values,
  # ]

  depends_on = [
    helm_release.istio,
  ]
}
