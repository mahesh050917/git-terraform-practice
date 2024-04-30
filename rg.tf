resource "azurerm_resource_group" "testrg" {
  name     = var.rgname
  location = "eastus"
}
