data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}
# data "azurerm_public_ip" "public_ip" {
#   name                = var.public_ip_name
#   resource_group_name = var.resource_group_name
# }
# data "azurerm_key_vault" "keyv" {
#   name                = var.key_vault_name
#   resource_group_name = var.resource_group_name
# }

# data "azurerm_key_vault_secret" "vmadname" {
#   name         = "vmadusernname"
#   key_vault_id = data.azurerm_key_vault.keyv.id
# }
# data "azurerm_key_vault_secret" "vmpsw" {
#   name         = "vmpasshide"
#   key_vault_id = data.azurerm_key_vault.keyv.id
# }