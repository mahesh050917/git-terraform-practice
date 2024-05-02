resource "random_password" "vm_passwd" {
  count       = 3
  length      = 11
  min_special = 1
}
