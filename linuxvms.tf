resource "azurerm_public_ip" "demoips" {
  count               = 0
  resource_group_name = azurerm_resource_group.testrg.name
  allocation_method   = "Static"
  location            = azurerm_resource_group.testrg.location
  name                = "linuxm-pip-${count.index}"
}

resource "azurerm_network_interface" "demonics" {
  count               = 0
  name                = "linuxvm-nic-${count.index}"
  resource_group_name = azurerm_resource_group.testrg.name
  location            = azurerm_resource_group.testrg.location
  ip_configuration {
    name                          = "linuxvm-ip"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = element(azurerm_subnet.testsubnets.*.id, count.index)
    public_ip_address_id          = element(azurerm_public_ip.demoips.*.id, count.index)
  }
}





resource "azurerm_linux_virtual_machine" "demovms" {
  depends_on          = [azurerm_key_vault.demokeyvault, azurerm_key_vault_secret.vm_kv_secrets]
  count               = 0
  name                = "linuxvm-${count.index}"
  resource_group_name = azurerm_resource_group.testrg.name
  location            = azurerm_resource_group.testrg.location
  size                = "Standard_B1ls"
  admin_username      = "adminuser"
  network_interface_ids = [
    element(azurerm_network_interface.demonics.*.id, count.index)
  ]
  disable_password_authentication = false
  admin_password                  = element(azurerm_key_vault_secret.vm_kv_secrets.*.value, count.index)
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
