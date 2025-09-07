variable "public_ip_name" {
  type = string
  description = "The name of the public IP address."
  
}
variable "resource_group_name" {
  type = string
  
}
variable "location" {
  type = string
}

variable "allocation_method" {
  type = string  
}