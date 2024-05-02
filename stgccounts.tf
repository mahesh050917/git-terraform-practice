#This is Storage account

resource "azurerm_storage_account" "demostg" {
  count                    = 3
  name                     = "demotsg654981${count.index}"
  resource_group_name      = azurerm_resource_group.testrg.name
  account_replication_type = "LRS"
  location                 = var.location
  account_tier             = "Standard"

}
