linux_vms = {
  "vm1" = {
    resource_group_name = "resource_group_1"
    location            = "central india"
    size                = "Standard_F2"
    # admin_username      = data.azurerm_key_vault_secret.username
    disable_password_authentication = false
    # admin_password      = data.azurerm_key_vault_secret.password
    network_interface_ids = ["nic1"]

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    image = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}