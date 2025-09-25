module "rg" {
  source              = "./modules/rg"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = module.rg.name
  vnet_name           = var.vnet_name
  vnet_cidr           = var.vnet_cidr
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  location            = module.rg.location

  depends_on = [module.rg]
}

module "acr" {
  source              = "./modules/acr"
  acr_name            = var.acr_name
  resource_group_name = module.rg.name
  location            = module.rg.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled

  depends_on = [module.rg]
}

module "aks" {
  source              = "./modules/aks"
  cluster_name        = var.aks_cluster_name
  location            = module.rg.location
  resource_group_name = module.rg.name
  dns_prefix          = var.aks_dns_prefix
  kubernetes_version  = var.kubernetes_version
  node_vm_size        = var.node_vm_size
  subnet_id           = module.vnet.public_subnet_id
  acr_id              = module.acr.acr_id
  min_node_count      = var.min_node_count
  max_node_count      = var.max_node_count
  
  tags = {
    Environment = "dev"
    Project     = "nats-server"
  }

  depends_on = [module.vnet, module.acr]
}

module "observability" {
  source = "./modules/observability"

  grafana_admin_password = var.grafana_admin_password
  monitoring_namespace   = "monitoring"

  depends_on = [module.aks]
}

module "storage_account" {
  source              = "./modules/storage_account"
  storage_account_name = var.storage_account_name
  resource_group_name = module.rg.name
  location            = module.rg.location

  depends_on = [module.rg]
}

module "keyvault" {
  source                   = "./modules/keyvault"
  keyvault_name            = var.keyvault_name
  resource_group_name      = module.rg.name
  location                 = module.rg.location
  tenant_id                = var.tenant_id
  sku_name                 = var.keyvault_sku
  soft_delete_retention_days = var.keyvault_soft_delete_retention_days
  purge_protection_enabled = var.keyvault_purge_protection

  depends_on = [module.rg]
}