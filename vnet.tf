resource "azurerm_virtual_network" "testvnet" {
  name                = "${var.rgname}-vnet"
  address_space       = var.address_space
  location            = azurerm_resource_group.testrg.location
  resource_group_name = azurerm_resource_group.testrg.name
}

