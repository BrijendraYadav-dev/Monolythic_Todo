resource_groups = {
  "rg1" = {
    name     = "todoapp-rg-dev"
    location = "centralindia"
    tags = {
      environment = "dev"
      project     = "todoapp"
    }
    managed_by = "Brijendra"
  }
}
storage_accounts = {
  "stg1" = {
    name                             = "todobrijendrastorage"
    resource_group_name              = "todoapp-rg-dev"
    location                         = "centralindia"
    account_tier                     = "Standard"
    account_replication_type         = "LRS"
    account_kind                     = "StorageV2"
    cross_tenant_replication_enabled = false
    access_tier                      = "Hot"
    public_network_access_enabled    = false
  }
}
storage_account_containers = {
  "container1" = {
    name                  = "todoappcontainer"
    resource_group_name   = "todoapp-rg-dev"
    location              = "centralindia"
    storage_account_name  = "todobrijendrastorage"
    container_access_type = "private"
  }
}
network = {
  vnet1 = {
    name                = "todoapp-vnet-dev"
    location            = "centralindia"
    resource_group_name = "todoapp-rg-dev"
    cidr                = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
      project     = "todoapp"
    }
    subnets = {
      subnet1 = {
        name = "frontend-subnet"
        cidr = ["10.0.1.0/24"]
      }
      subnet2 = {
        name = "backend-subnet"
        cidr = ["10.0.2.0/24"]
      }
    }
  }
}
network_interfaces = {
  nic1 = {
    nic_name            = "frontend-nic-dev"
    location            = "centralindia"
    resource_group_name = "todoapp-rg-dev"
    subnet_name         = "frontend-subnet"
    public_ip_name      = "frontend-publicip-dev"
    vnet_name           = "todoapp-vnet-dev"
  }

  nic2 = {
    nic_name            = "backend-nic-dev"
    location            = "centralindia"
    resource_group_name = "todoapp-rg-dev"
    subnet_name         = "backend-subnet"
    public_ip_name      = "backend-publicip-dev"
    vnet_name           = "todoapp-vnet-dev"
  }
}

public_ips = {
  publicip1 = {
    name                = "frontend-publicip-dev"
    location            = "centralindia"
    resource_group_name = "todoapp-rg-dev"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "dev"
      project     = "todoapp"
    }
  }


  publicip2 = {
    name                = "backend-publicip-dev"
    location            = "centralindia"
    resource_group_name = "todoapp-rg-dev"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "dev"
      project     = "todoapp"
    }

  }
}


database_servers = {
  dbserver1 = {
    server_name                  = "todoappdbserverdev"
    location                     = "centralindia"
    resource_group_name          = "todoapp-rg-dev"
    administrator_login          = "dbadmin"
    administrator_login_password = "P@ssw0rd1234"
    version                      = "12.0"
    tags = {
      environment = "dev"
      project     = "todoapp"
    }
  }
}
databases = {

  database1 = {
    name       = "todoappdbdev"
    server_key = "dbserver1"
  }
}
key_vaults = {
  kv1 = {
    key_vault_name      = "brijendra-kv-dev"
    location            = "southcentralus"
    resource_group_name = "todoapp-rg-dev"
    sku_name            = "standard"
    tags = {
      environment = "dev"
      project     = "todoapp"
    }
  }
}
key_vault_secrets = {
  frontend_vm_secret1 = {
    secret_name        = "vm1-username"
    secret_value       = "Brijendra"
    key_vault_name      = "brijendra-kv-dev"
    resource_group_name = "todoapp-rg-dev"

  }
  frontend_vm_secret2 = {
    secret_name         = "vm1-password"
    secret_value        = "Diwali@123"
    key_vault_name      = "brijendra-kv-dev"
    resource_group_name = "todoapp-rg-dev"

  }

  backend_vm_secret1 = {
    secret_name        = "vm2-username"
    secret_value       = "Brijendra"
    key_vault_name      = "brijendra-kv-dev"
    resource_group_name = "todoapp-rg-dev"

  }
backend_vm_secret2 = {
    secret_name         = "vm2-password"
    secret_value        = "Diwali@1234"
    key_vault_name      = "brijendra-kv-dev"
    resource_group_name = "todoapp-rg-dev"

  }
}

virtual_machines = {
  vm1 = {
    vm_name                 = "frontend-vm"
    resource_group_name     = "todoapp-rg-dev"
    location                = "centralindia"
    size                    = "Standard_D2_V3"
    key_vault_name          = "brijendra-kv-dev"
    nic_name                = "frontend-nic-dev"
    vm_username_secret_name = "vm1-username"
    vm_password_secret_name = "vm1-password"
    caching                 = "ReadWrite"
    storage_account_type    = "Standard_LRS"
    publisher               = "Canonical"
    offer                   = "0001-com-ubuntu-server-jammy"
    sku                     = "22_04-lts"
    version                 = "latest"


  }


  vm2 = {
    vm_name                 = "backend-vm"
    resource_group_name     = "todoapp-rg-dev"
    location                = "centralindia"
    size                    = "Standard_D2_V3"
    key_vault_name          = "brijendra-kv-dev"
    nic_name                = "backend-nic-dev"
    vm_username_secret_name = "vm2-username"
    vm_password_secret_name = "vm2-password"
    caching                 = "ReadWrite"
    storage_account_type    = "Standard_LRS"
    publisher               = "Canonical"
    offer                   = "0001-com-ubuntu-server-jammy"
    sku                     = "22_04-lts"
    version                 = "latest"


  }
}


