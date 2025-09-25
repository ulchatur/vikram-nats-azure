# modules/observability/outputs.tf
output "prometheus_release_name" {
  value = helm_release.kube_prometheus_stack.name
}

output "istio_namespace" {
  value = kubernetes_namespace.istio_system.metadata[0].name
}
