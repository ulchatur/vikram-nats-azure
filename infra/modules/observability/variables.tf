# modules/observability/variables.tf
variable "monitoring_namespace" {
  type    = string
  default = "monitoring"
}

variable "prometheus_release_name" {
  type    = string
  default = "kube-prom-stack"
}

variable "grafana_admin_password" {
  type    = string
  description = "Grafana admin password (sensitive)"
  sensitive = true
  default = "ChangeMe123!"
}

variable "istio_namespace" {
  type    = string
  default = "istio-system"
}
