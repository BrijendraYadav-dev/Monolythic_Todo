resource "azurerm_key_vault_secret" "kv_secret" {
    for_each = var.key_vault_secret
  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}