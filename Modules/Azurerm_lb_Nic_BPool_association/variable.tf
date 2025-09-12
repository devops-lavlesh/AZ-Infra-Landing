variable "ip_configuration_name" {
  description = "The name of the IP configuration to associate with the backend address pool."
  type        = string
  
}
variable "nic_name" {
  description = "The name of the Network Interface to associate with the backend address pool."
  type        = string
  
}
variable "resource_group_name" {
  description = "The name of the resource group where the Network Interface is located."
  type        = string
  
}

variable "lb_backend_address_pool_name" {
  description = "The name of the Load Balancer backend address pool to associate with the Network Interface."
  type        = string
  
}
variable "lb_name" {
  description = "The name of the Load Balancer."
  type        = string
  
}