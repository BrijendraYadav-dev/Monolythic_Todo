resource "azurerm_mssql_database" "db_database" {
  for_each  = var.databases

  name      = each.value.name
  server_id = var.server_id[each.value.server_key]
}