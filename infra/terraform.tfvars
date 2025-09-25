#RG values
resource_group_name = "nats-server-rg"
location            = "eastus"

#Vnet values
vnet_name       = "nats-server-vnet"
vnet_cidr       = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24"]
private_subnets = ["10.0.2.0/24"]

#ACR values
acr_name            = "natserveracr"
acr_sku             = "Basic"
acr_admin_enabled   = false

#AKS values
aks_cluster_name   = "nats-server-aks"
aks_dns_prefix     = "nats-server"
kubernetes_version = "1.31.10"
node_vm_size      = "Standard_D2s_v3"
min_node_count    = 1
max_node_count    = 3

# Storage Account values
storage_account_name = "natsserverstorage"
tier                 = "Standard"
replication          = "LRS"
kind                 = "StorageV2"

#Keyvault values
keyvault_name                       = "natserverkv"
tenant_id                           = "708433dc-7ab2-4958-923a-f5ab282800cd"
keyvault_sku                        = "standard"
keyvault_soft_delete_retention_days = 7
keyvault_purge_protection           = true