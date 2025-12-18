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