variable "virtual_networks" {
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
