resource "azurerm_virtual_network" "vnet" {
  for_each            = var.virtual_networks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.cidr
  tags                = each.value.tags
  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name           = subnet.value.name
      address_prefixes = subnet.value.cidr

    }
  }
}
