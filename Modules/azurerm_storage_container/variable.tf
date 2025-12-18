variable "storage_account_containers" {
  description = "A map of storage account data configurations"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    storage_account_name = string
    container_access_type = string
  }))
}