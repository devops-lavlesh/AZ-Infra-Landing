variable "lb_name" {
  type        = string
  description = "The name of the Load Balancer."  
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string  
}
variable "public_ip_name" {
  type = string
  
}
variable "lb_backend_address_pool_name" {
    type        = string
    description = "The name of the Load Balancer Backend Address Pool."
  
}