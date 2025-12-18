variable "storage_account" {
  description = "A map of storage account configurations"
  type = map(object({
    name                              = string
    resource_group_name               = string
    location                          = string
    account_tier                      = string
    account_replication_type          = string
    account_kind                      = string
    cross_tenant_replication_enabled  = bool
    access_tier                       = string
    public_network_access_enabled     = bool
  }))
}

