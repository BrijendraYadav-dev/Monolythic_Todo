output "database_server_ids" {
  description = "The IDs of the created database servers."
  value       = {
    for x, server in azurerm_mssql_server.db_server :
    x => server.id
  }
}
