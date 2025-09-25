output "acr_name" {
  description = "The name of the ACR"
  value       = azurerm_container_registry.main.name
}

output "acr_login_server" {
  description = "The login server URL of the ACR"
  value       = azurerm_container_registry.main.login_server
}

output "acr_id" {
  description = "The ID of the ACR"
  value       = azurerm_container_registry.main.id
}
