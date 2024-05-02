data "azurerm_client_config" "current" {}



resource "azurerm_key_vault" "demokeyvault" {
  name                = "testkeyvault0976"
  location            = azurerm_resource_group.testrg.location
  resource_group_name = azurerm_resource_group.testrg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

}


resource "azurerm_key_vault_access_policy" "demouserpolicy" {
  key_vault_id = azurerm_key_vault.demokeyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id




  secret_permissions = [
    "Get", "List", "Purge", "Recover", "Restore", "Set", "Backup", "Delete"
  ]
}


resource "azurerm_key_vault_access_policy" "demoservicepolicy" {
  key_vault_id = azurerm_key_vault.demokeyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "7ba3dba0-7348-40d1-9ab5-d9057788bedc"
  #  application_id = "9251a5a0-f7ce-4513-b8bb-2243e30253f1"

  secret_permissions = [
    "Get", "List", "Purge", "Recover", "Restore", "Set", "Backup", "Delete"
  ]
}


