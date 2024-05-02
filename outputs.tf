output "vm_public_ips" {
  value = azurerm_public_ip.demoips.*.id
}