resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = var.monitoring_namespace
  }
}

resource "helm_release" "kube_prometheus_stack" {
  name       = var.prometheus_release_name
  chart      = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  create_namespace = false

  set {
    name  = "prometheusOperator.createCustomResource"
    value = "true"
  }

  set_sensitive {
    name  = "grafana.adminPassword"
    value = var.grafana_admin_password
  }

  values = [
    <<-EOF
    prometheus:
      prometheusSpec:
        serviceMonitorSelectorNilUsesHelmValues: false
    grafana:
      enabled: true
      persistence:
        enabled: false
    EOF
  ]
}

resource "kubernetes_namespace" "istio_system" {
  metadata {
    name = var.istio_namespace
  }
}

resource "helm_release" "istio_base" {
  name       = "istio-base"
  chart      = "base"
  repository = "https://istio-release.storage.googleapis.com/charts"
  namespace  = kubernetes_namespace.istio_system.metadata[0].name
  create_namespace = false
  # base installs CRDs used by others
}

resource "helm_release" "istiod" {
  depends_on = [helm_release.istio_base]
  name       = "istiod"
  chart      = "istiod"
  repository = "https://istio-release.storage.googleapis.com/charts"
  namespace  = kubernetes_namespace.istio_system.metadata[0].name
  create_namespace = false

}

resource "helm_release" "istio_gateway" {
  depends_on = [helm_release.istiod]
  name       = "istio-ingress"
  chart      = "gateway"
  repository = "https://istio-release.storage.googleapis.com/charts"
  namespace  = kubernetes_namespace.istio_system.metadata[0].name
  create_namespace = false
}

resource "helm_release" "istio_egress" {
  depends_on = [helm_release.istiod]
  name       = "istio-egress"
  chart      = "gateway"
  repository = "https://istio-release.storage.googleapis.com/charts"
  namespace  = kubernetes_namespace.istio_system.metadata[0].name

  set {
    name  = "name"
    value = "istio-egress"
  }
}