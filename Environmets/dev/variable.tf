variable "resource_groups" {
    description = "A map of resource group configurations"
  type = map(object({
    name        = string
    location    = string
    tags        = map(string)
    managed_by  = string
  }))
}
variable "storage_accounts" {
  description = "A map of storage account configurations"
  type = map(object({
    name                             = string
    resource_group_name              = string
    location                         = string
    account_tier                     = string
    account_replication_type         = string
    account_kind                     = string
    cross_tenant_replication_enabled = bool
    access_tier                      = string
    public_network_access_enabled    = bool
  }))
}
variable "storage_account_containers" {
  description = "A map of storage account container configurations"
  type = map(object({
    name                  = string
    resource_group_name   = string
    location              = string
    storage_account_name  = string
    container_access_type = string
  }))
}
variable "network" {
  description = "A map of virtual networks to create."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    cidr                = list(string)
    tags                = map(string)
    subnets = map(object({
      name = string
      cidr = list(string)
    }))
  }))
}

variable "network_interfaces" {
  description = "A map of network interfaces to create."
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    vnet_name           = string
    subnet_name         = string
    public_ip_name      = string
  }))
}
variable "public_ips" {
    description = "A map of public IP configurations"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
    tags                = map(string)
  }))
}
variable "database_servers" {
   description = "A map of database servers to create."
  type = map(object({
    server_name         = string
    location            = string
    resource_group_name = string
    administrator_login = string
    administrator_login_password = string
    version            = string
    tags               = map(string)
  }))
}
variable "databases" {
   description = "A map of database configurations"
    type        = map(object({
        name        = string
        server_key  = string
    }))
}
variable "key_vaults" {
   description = "A map of Key Vault configurations"
    type        = map(object({
        key_vault_name                 = string
        location             = string
        resource_group_name  = string
        sku_name             = string
        tags                 = map(string)
    }))
}
variable "virtual_machines" {
   type = map(object({
    vm_name                = string
    resource_group_name = string
    location            = string
    size                = string
    nic_name            = string
    key_vault_name = string
    vm_username_secret_name = string
    vm_password_secret_name = string
    

      publisher = string
      offer     = string
      sku       = string
      version   = string
    

    
      caching              = string
      storage_account_type = string
  
  }))
}
variable "key_vault_secrets" {
   type = map(object({
        secret_name = string
         secret_value = string
         key_vault_name = string
         resource_group_name = string



    }))
}











