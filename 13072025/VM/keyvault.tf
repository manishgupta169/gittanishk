data "azurerm_key_vault" "kv" {
  name                = "locker1234"
  resource_group_name = "resource_group_1"
}

data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.kv.id
}
