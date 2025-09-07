variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  
}
variable "nic_name" {
  description = "The name of the network interface."
  type        = string
  
}
variable "location" {
  description = "The Azure region where the virtual machine will be created."
  type        = string
  
}
variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  type        = string
  
}
variable "virtual_machine_size" {
  description = "The size of the virtual machine."
  type        = string
  
}
variable "publisher_image" {
  description = "The publisher of the image to use for the virtual machine."
  type        = string
  
}
variable "offer_image" {
  description = "The offer of the image to use for the virtual machine."
  type        = string
  
}
variable "sku_image" {
  description = "The SKU of the image to use for the virtual machine."
  type        = string
  
}
variable "version_image" {
  description = "The version of the image to use for the virtual machine."
  type        = string
  
}
variable "subnet_name" {
  description = "The name of the subnet where the virtual machine will be created."
  type        = string
  
}
variable "virtual_network_name" {
  description = "The name of the virtual network where the virtual machine will be created."
  type        = string
  
}
# variable "public_ip_name" {
#   description = "The name of the public IP address for the frontend VM."
#   type        = string
  
# }
# variable "key_vault_name" {
#   description = "The name of the Key Vault where secrets are stored."
#   type        = string
  
# }
variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
}
variable "admin_password" {
  description = "The admin password for the virtual machine."
  type        = string
  
}