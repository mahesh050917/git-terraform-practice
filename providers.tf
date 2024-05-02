terraform {
  backend "azurerm" {
    resource_group_name  = "backendrg"
    storage_account_name = "backendtfstorage1765"
    container_name       = "devterraform"
    key                  = "devterraform.tfstate"
  }
}


provider "azurerm" {
  features {}
}


