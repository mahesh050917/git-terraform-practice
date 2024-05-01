resource "azurerm_resource_group" "demorg1" {
  name     = "backendrg"
  location = "westus"
}





resource "azurerm_storage_account" "demostg" {
  name                     = "backendtfstorage1765"
  account_replication_type = "LRS"
  account_tier             = "Standard"
  resource_group_name      = azurerm_resource_group.demorg1.name
  location                 = azurerm_resource_group.testrg.location
}
