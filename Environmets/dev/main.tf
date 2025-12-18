module "resource_groups" {
  source          = "../../Modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}
module "storage_accounts" {
  depends_on      = [module.resource_groups]
  source          = "../../Modules/azurerm_storage_account"
  storage_account = var.storage_accounts
}

module "storage_containers" {
  depends_on                 = [module.storage_accounts]
  source                     = "../../Modules/azurerm_storage_container"
  storage_account_containers = var.storage_account_containers
}
module "virtual_networks" {
  depends_on       = [module.resource_groups]
  source           = "../../Modules/azurerm_networks"
  virtual_networks = var.network
}
module "network_interfaces" {
  depends_on         = [module.virtual_networks, module.resource_groups, module.public_ips]
  source             = "../../Modules/azurerm_nic"
  network_interfaces = var.network_interfaces
}
module "public_ips" {
  depends_on = [module.resource_groups, module.virtual_networks]
  source     = "../../Modules/azurerm_public_ip"

  public_ips = var.public_ips
}
module "database_server" {
  depends_on       = [module.resource_groups]
  source           = "../../Modules/azurerm_database_server"
  database_servers = var.database_servers


}
module "databases" {
  depends_on = [module.database_server]
  source     = "../../Modules/azurerm_database"
  databases  = var.databases
  server_id  = module.database_server.database_server_ids
}
module "key_vaults" {
  depends_on = [module.resource_groups]
  source     = "../../Modules/Azure_Keyvault"
  key_vaults = var.key_vaults
}
module "key_secret" {
  depends_on       = [module.resource_groups, module.key_vaults]
  source           = "../../Modules/azurerm_key_secret"
  key_vault_secret = var.key_vault_secrets

}

module "azurerm_vms" {
  depends_on       = [module.resource_groups, module.network_interfaces, module.key_vaults, module.key_secret]
  source           = "../../Modules/Azurerm_VM"
  virtual_machines = var.virtual_machines


}

