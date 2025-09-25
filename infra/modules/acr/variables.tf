variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group in which ACR will be created"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sku" {
  description = "The SKU of the Container Registry"
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled"
  type        = bool
  default     = false
}
