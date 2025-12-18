variable "virtual_machines" {
  type = map(object({
    vm_name                = string
    resource_group_name = string
    location            = string
    size                = string
    nic_name            = string
    key_vault_name = string
    vm_username_secret_name = string
    vm_password_secret_name = string
    

      publisher = string
      offer     = string
      sku       = string
      version   = string
    

    
      caching              = string
      storage_account_type = string
  
  }))
}