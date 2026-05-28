
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.50.0"
    }

  }
  backend "azurerm" {
  resource_group_name  = "Brijendra_RG"
  storage_account_name = "brijendrastoragelab"
  container_name       = "brijendracontainerlab"
  key                  = "brijendratfstate"
}

}
provider "azurerm" {
  features {}
  subscription_id = "fe4b406c-7c69-45b7-8c18-908662c0d423"
}