resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_kind             = var.kind
  account_tier             = var.tier
  account_replication_type = var.replication

  tags = {
    Environment = "dev"
    Project     = "nats-server"
  }
}
