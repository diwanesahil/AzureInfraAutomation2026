terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.67.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "3fb059b8-93d4-4b42-b323-c4fe44b4b3c7"
  tenant_id = "e23a194e-fe58-4ac1-9edf-c7914a469ba1"

  }