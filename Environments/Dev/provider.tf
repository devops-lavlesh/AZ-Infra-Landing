terraform {

  required_version = ">=v1.4.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }

  }
  backend "azurerm" {
    subscription_id      = "a60aa6b9-597f-4824-8c46-46d7412439d3"
    resource_group_name  = "shineremote-rg"
    storage_account_name = "shineremotestg"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"

  }
}

provider "azurerm" {
  features {}
  subscription_id = "a60aa6b9-597f-4824-8c46-46d7412439d3"
}