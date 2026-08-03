terraform {
  backend "azurerm" {
    resource_group_name  = "RG-STORE"
    storage_account_name = "siimistorage4statefiles"
    container_name       = "for-state-files"
    key                  = "production.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.1"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "488eb850-51fb-42b5-bb04-2683ca6067c9"
}