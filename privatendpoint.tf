resource "azurerm_private_endpoint" "demoprivateendpoint" {
  name                = "privateendpoint"
  location            = azurerm_resource_group.testrg.location
  resource_group_name = azurerm_resource_group.testrg.name
  subnet_id           = azurerm_subnet.testprivatesubnet.id

  private_service_connection {
    name                           = "demo_private_service_connec"
    private_connection_resource_id = azurerm_key_vault.demokeyvault.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private_vault_dns_zone"
    private_dns_zone_ids = [azurerm_private_dns_zone.private_dnszone.id]
  }

  depends_on = [azurerm_key_vault.demokeyvault]
}
