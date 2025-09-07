variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string  
}
variable "resource_group_name" {
  description = "The name of the resource group where the storage account will be created."
  type        = string
}
variable "location" {
  description = "The Azure location where the storage account will be created."
  type        = string
  
}
variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."
  type        = string
}
variable "account_replication_type" {
  description = "Defines the Replication type to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS and GZRS."
  type        = string
}
