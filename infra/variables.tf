#RG Variables
variable "resource_group_name" {
  description = "New RG"
  type        = string
}

#Vnet Variables
variable "vnet_name" {
  description = "VNet name"
  type        = string
}

variable "vnet_cidr" {
  description = "VNet CIDR Range"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet CIDR range"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet CIDR range"
  type        = list(string)
}

variable "location" {
  description = "Azure region"
  type        = string
}

#ACR Variables
variable "acr_name" {
  description = "ACR name"
  type        = string
}

variable "acr_sku" {
  description = "ACR SKU (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"
}

variable "acr_admin_enabled" {
  description = "Enable admin user for ACR?"
  type        = bool
  default     = false
}

#AKS Variables
variable "aks_cluster_name" {
  description = "AKS cluster name"
  type        = string
}

variable "aks_dns_prefix" {
  description = "DNS prefix for AKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.28.9"
}

variable "node_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "min_node_count" {
  description = "Minimum nodes for auto-scaling"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum nodes for auto-scaling"
  type        = number
  default     = 5
}

#Observability Variables
variable "grafana_admin_password" {
  description = "Grafana admin password for monitoring stack"
  type        = string
  default     = "AdminUser123!"
  sensitive   = true
}

#Storage Account Variables
variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
}

variable "tier" {
  description = "Tier of the storage account (Standard / Premium)"
  type        = string
  default     = "Standard"
}

variable "replication" {
  description = "Replication type of the storage account (LRS / GRS / ZRS / RAGRS)"
  type        = string
  default     = "LRS"
}

variable "kind" {
  description = "Kind of storage account (StorageV2, BlobStorage, FileStorage, etc.)"
  type        = string
  default     = "StorageV2"
}

#Key Vault Variables
variable "keyvault_name" {
  description = "Key Vault name (must be globally unique)"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD Tenant ID"
  type        = string
}

variable "keyvault_sku" {
  description = "Key Vault SKU (standard or premium)"
  type        = string
  default     = "standard"
}

variable "keyvault_soft_delete_retention_days" {
  description = "Soft delete retention days"
  type        = number
  default     = 7
}

variable "keyvault_purge_protection" {
  description = "Enable purge protection?"
  type        = bool
  default     = true
}