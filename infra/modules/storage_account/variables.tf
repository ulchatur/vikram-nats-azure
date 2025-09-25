variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where the storage account will be created"
  type        = string
}

variable "sku" {
  description = "SKU for the storage account (Standard_LRS, Standard_GRS, Premium_LRS, etc.)"
  type        = string
  default     = "Standard_LRS"
}

variable "tier" {
  description = "Tier of the storage account (Standard / Premium)"
  type        = string
  default     = "Standard"
}

variable "replication" {
  description = "Replication type (LRS / GRS / ZRS / RAGRS)"
  type        = string
  default     = "LRS"
}

variable "kind" {
  description = "Kind of storage account (StorageV2, BlobStorage, FileStorage, etc.)"
  type        = string
  default     = "StorageV2"
}

