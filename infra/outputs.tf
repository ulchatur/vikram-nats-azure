#RG Outputs
output "resource_group_name" {
  description = "RG Name"
  value       = module.rg.name
}

#Vnet Outputs
output "vnet_name" {
  description = "VNet Name"
  value       = module.vnet.vnet_name
}

output "public_subnet_names" {
  description = "Public subnet name"
  value       = module.vnet.public_subnet_names
}

output "private_subnet_names" {
  description = "Private subnet name"
  value       = module.vnet.private_subnet_names
}

output "public_nsg_name" {
  description = "Public NSG"
  value       = module.vnet.public_nsg_name
}

output "private_nsg_name" {
  description = "Private NSG"
  value       = module.vnet.private_nsg_name
}

#ACR Outputs
output "acr_name" {
  description = "ACR Name"
  value       = module.acr.acr_name
}

output "acr_login_server" {
  description = "ACR Login Server"
  value       = module.acr.acr_login_server
}

output "acr_id" {
  description = "ACR ID"
  value       = module.acr.acr_id
}

# AKS Outputs
output "aks_cluster_name" {
  description = "AKS Cluster Name"
  value       = module.aks.cluster_name
}

output "aks_cluster_fqdn" {
  description = "AKS Cluster FQDN"
  value       = module.aks.cluster_fqdn
}

# Storage Account
output "storage_account_id" {
  description = "ID of the storage account"
  value       = module.storage_account.storage_account_id
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = module.storage_account.storage_account_name
}

#Keyvault Outputs
output "keyvault_uri" {
  description = "Key Vault URI"
  value       = module.keyvault.keyvault_uri
}