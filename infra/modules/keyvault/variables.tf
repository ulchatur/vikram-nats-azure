variable "keyvault_name" {
  description = "The name of the Key Vault (must be globally unique)"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the Key Vault"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID of the Azure AD"
  type        = string
}

variable "sku_name" {
  description = "SKU for Key Vault (standard or premium)"
  type        = string
  default     = "standard"
}

variable "soft_delete_retention_days" {
  description = "Soft delete retention days"
  type        = number
  default     = 7
}

variable "purge_protection_enabled" {
  description = "Enable purge protection"
  type        = bool
  default     = true
}
