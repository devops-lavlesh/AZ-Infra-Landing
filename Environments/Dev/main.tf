# this is the azure infra code
module "resource_group" {
  source = "../Child_Modules/Azurerm_Resource_Group"

  resource_group_name = "shinedev-rg"
  location            = "Central India"

}
module "storage_account" {
  source     = "../Child_Modules/Azurerm_Storage_Account"
  depends_on = [module.resource_group]

  storage_account_name     = "shinedevstg"
  resource_group_name      = "shinedev-rg"
  location                 = "Central India"
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

module "virtual_network" {
  source = "../Child_Modules/Azurerm_Virtual_Networks"

  depends_on = [module.resource_group]

  virtual_network_name = "shine-vnet"
  location             = "Central India"
  resource_group_name  = "shinedev-rg"
  address_space        = ["10.0.0.0/16"]

}

module "frontend_subnet" {
  source = "../Child_Modules/Azurerm_Subnets"

  depends_on = [module.virtual_network]

  subnet_name          = "shine-front-subnet"
  resource_group_name  = "shinedev-rg"
  virtual_network_name = "shine-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}

module "shine1_vm" {

  source = "../Child_Modules/Azurerm_Virtual_Machine"

  depends_on = [module.virtual_network, module.frontend_subnet]

  resource_group_name  = "shinedev-rg"
  nic_name             = "shinefrontnic1"
  location             = "Central India"
  virtual_machine_name = "shine1vm"
  virtual_machine_size = "Standard_B1s"
  admin_username       = "devopsuser"
  admin_password       = "Devopslucky@1001"
  publisher_image      = "Canonical"
  offer_image          = "0001-com-ubuntu-server-focal"
  sku_image            = "20_04-lts"
  version_image        = "latest"
  virtual_network_name = "shine-vnet"
  subnet_name          = "shine-front-subnet"
}
module "shine2_vm" {

  source = "../Child_Modules/Azurerm_Virtual_Machine"

  depends_on = [module.virtual_network, module.frontend_subnet]

  resource_group_name  = "shinedev-rg"
  nic_name             = "shinefrontnic2"
  location             = "Central India"
  virtual_machine_name = "shine2vm"
  virtual_machine_size = "Standard_B1s"
  admin_username       = "devopsuser"
  admin_password       = "Devopslucky@1001"
  publisher_image      = "Canonical"
  offer_image          = "0001-com-ubuntu-server-focal"
  sku_image            = "20_04-lts"
  version_image        = "latest"
  virtual_network_name = "shine-vnet"
  subnet_name          = "shine-front-subnet"

}


module "lb_public_ip" {
  source     = "../Child_Modules/Azurerm_Public_IP"
  depends_on = [module.resource_group]

  public_ip_name      = "shinelbpip"
  resource_group_name = "shinedev-rg"
  location            = "Central India"
  allocation_method   = "Static"
}