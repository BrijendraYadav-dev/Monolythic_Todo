variable "server_id" {
    description = "A map of database server IDs"
    type        = map(string)
}
variable "databases" {
    description = "A map of database configurations"
    type        = map(object({
        name        = string
        server_key  = string
    }))
}

  