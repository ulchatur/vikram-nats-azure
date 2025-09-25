output "public_subnet_id" {
  description = "Public subnet ID"
  value       = azurerm_subnet.public.id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = azurerm_subnet.private.id
}

output "vnet_id" {
  description = "VNet ID"
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "VNet name"
  value       = azurerm_virtual_network.main.name
}

output "public_subnet_names" {
  description = "Public subnet name"
  value       = azurerm_subnet.public.name
}

output "private_subnet_names" {
  description = "Private subnet name"
  value       = azurerm_subnet.private.name
}

output "public_nsg_name" {
  description = "Public NSG name"
  value       = azurerm_network_security_group.public.name
}

output "private_nsg_name" {
  description = "Private NSG name"
  value       = azurerm_network_security_group.private.name
}

output "public_nsg_id" {
  description = "Public NSG ID"
  value       = azurerm_network_security_group.public.id
}

output "private_nsg_id" {
  description = "Private NSG ID"
  value       = azurerm_network_security_group.private.id
}