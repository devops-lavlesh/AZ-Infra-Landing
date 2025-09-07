data "azurerm_key_vault" "keyv" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "sqlserveradname" {
  name         = "sqladusernname"
  key_vault_id = data.azurerm_key_vault.keyv.id
}
data "azurerm_key_vault_secret" "sqlserverpsw" {
  name         = "sqlserverhide"
  key_vault_id = data.azurerm_key_vault.keyv.id
}