
resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "starbucksPublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backendpool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = var.lb_backend_address_pool_name
}

resource "azurerm_lb_probe" "probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "ssh-running-probe"
  port            = 80
}
resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "starbucksLBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name =  "starbucksPublicIPAddress"
  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.lb_backendpool.id ]
  probe_id                       = azurerm_lb_probe.probe.id
}