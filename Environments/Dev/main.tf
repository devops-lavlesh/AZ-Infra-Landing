# this is the azure infra code
module "resource_group" {
  source = "../../Modules/Azurerm_Resource_Group"

  resource_group_name = "shinedev-rg"
  location            = "Central India"

}
# module "storage_account" {
#   source     = "../../Modules/Azurerm_Storage_Account"
#   depends_on = [module.resource_group]

#   storage_account_name     = "shinedevstg"
#   resource_group_name      = "shinedev-rg"
#   location                 = "Central India"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

# }

module "virtual_network" {
  source = "../../Modules/Azurerm_Virtual_Networks"

  depends_on = [module.resource_group]

  virtual_network_name = "shine-vnet"
  location             = "Central India"
  resource_group_name  = "shinedev-rg"
  address_space        = ["10.0.0.0/16"]

}

module "frontend_subnet" {
  source = "../../Modules/Azurerm_Subnets"

  depends_on = [module.virtual_network]

  subnet_name          = "shine-front-subnet"
  resource_group_name  = "shinedev-rg"
  virtual_network_name = "shine-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}

module "shine1_vm" {

  source = "../../Modules/Azurerm_Virtual_Machine"

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

  source = "../../Modules/Azurerm_Virtual_Machine"

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
  source     = "../../Modules/Azurerm_Public_IP"
  depends_on = [module.resource_group]

  public_ip_name      = "shinelbpip"
  resource_group_name = "shinedev-rg"
  location            = "Central India"
  allocation_method   = "Static"
}

module "load_balancer" {
  source = "../../Modules/Azurerm_Load_Balancer"

  depends_on = [module.lb_public_ip, module.frontend_subnet]

  lb_name                      = "shinelb"
  location                     = "Central India"
  public_ip_name               = "shinelbpip"
  resource_group_name          = "shinedev-rg"
  lb_backend_address_pool_name = "shinelbbackendpool"
  
}
module "shine1_nic_lb_bpool_association" {
  source = "../../Modules/Azurerm_lb_Nic_BPool_association"

  depends_on = [module.shine1_vm, module.load_balancer]

  nic_name                     = "shinefrontnic1"
  resource_group_name          = "shinedev-rg"
  lb_name                      = "shinelb"
  lb_backend_address_pool_name = "shinelbbackendpool"
  ip_configuration_name        = "internal"
  
}

module "shine2_nic_lb_bpool_association" {
  source = "../../Modules/Azurerm_lb_Nic_BPool_association"

  depends_on = [module.shine2_vm, module.load_balancer]

  nic_name                     = "shinefrontnic2"
  resource_group_name          = "shinedev-rg"
  lb_name                      = "shinelb"
  lb_backend_address_pool_name = "shinelbbackendpool"
  ip_configuration_name        = "internal"
  
}