data "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}
data "azurerm_lb" "lb" {
  name                = var.lb_name
  resource_group_name = var.resource_group_name
}
data "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  name            = var.lb_backend_address_pool_name
  loadbalancer_id = data.azurerm_lb.lb.id
}

resource "azurerm_network_interface_backend_address_pool_association" "backpoolassociation" {
  network_interface_id    = data.azurerm_network_interface.nic.id
  ip_configuration_name   = var.ip_configuration_name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.lb_backend_pool.id
}


