terraform {

  required_version = ">=v1.4.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "b3b6b7ed-0b15-49ca-b3ce-092e07ca3fef"
    resource_group_name  = "shineremote-rg"
    storage_account_name = "shineremotestg"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"

  }
}

provider "azurerm" {
  features {}
  subscription_id = "b3b6b7ed-0b15-49ca-b3ce-092e07ca3fef"
}