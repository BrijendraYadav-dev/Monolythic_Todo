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

