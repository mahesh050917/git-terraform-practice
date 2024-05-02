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

resource "azurerm_subnet" "testprivatesubnet" {

  name                 = "testprivateendpointsubnet"
  virtual_network_name = azurerm_virtual_network.testvnet.name
  address_prefixes     = var.privateendpoint_address
  resource_group_name  = azurerm_resource_group.testrg.name
}

resource "azurerm_private_dns_zone" "private_dnszone" {
  name                = "vaultprivatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.testrg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_link" {
  name                  = "privatednslink"
  resource_group_name   = azurerm_resource_group.testrg.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dnszone.name
  virtual_network_id    = azurerm_virtual_network.testvnet.id
}
