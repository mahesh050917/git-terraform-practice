resource "azurerm_key_vault_secret" "vm_kv_secrets" {
  count        = 3
  name         = "vmpasswd-${count.index}"
  value        = element(random_password.vm_passwd.*.result, count.index)
  key_vault_id = azurerm_key_vault.demokeyvault.id

  depends_on = [azurerm_key_vault_access_policy.demoservicepolicy, azurerm_key_vault_access_policy.demouserpolicy]
}
