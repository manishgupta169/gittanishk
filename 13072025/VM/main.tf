resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.linux_vms
  name                = "${each.key}-machine"
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault_secret.username.value
  disable_password_authentication = each.value.disable_password_authentication
  admin_password      = data.azurerm_key_vault_secret.password.value
  network_interface_ids = [
    for key in each.value.nic_key : var.nic_ids[key]
  ]


  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = each.value.image.publisher
    offer     = each.value.image.offer
    sku       = each.value.image.sku
    version   = each.value.image.version
  }
}