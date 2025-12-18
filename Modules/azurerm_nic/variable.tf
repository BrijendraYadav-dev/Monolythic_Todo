variable "network_interfaces" {
  description = "A map of network interfaces to create."
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    vnet_name           = string
    subnet_name         = string
    public_ip_name      = string
  }))
}
