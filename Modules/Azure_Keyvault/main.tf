resource "azurerm_key_vault" "kv" {
    for_each = var.key_vaults
    name                     = each.value.key_vault_name
    location                 = each.value.location
    resource_group_name      = each.value.resource_group_name
    tenant_id                = data.azurerm_client_config.current.tenant_id
    sku_name                 = each.value.sku_name
    tags                     = each.value.tags
    access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete"
  ]

  key_permissions = [
    "Get",
    "List",
    "Create"
  ]

  certificate_permissions = [
    "Get",
    "List"
  ]
}
}

