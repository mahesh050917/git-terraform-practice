resource "azurerm_virtual_network" "testvnet" {
  name                = "${var.rgname}-vnet"
  address_space       = var.address_space
  location            = azurerm_resource_group.testrg.location
  resource_group_name = azurerm_resource_group.testrg.name

}


resource "azurerm_subnet" "testsubnets" {
  count                = 3
  name                 = "${var.rgname}-snet${count.index}"
  virtual_network_name = azurerm_virtual_network.testvnet.name
  address_prefixes     = [element(var.address_prefixes, count.index)]
  resource_group_name  = azurerm_resource_group.testrg.name
}
