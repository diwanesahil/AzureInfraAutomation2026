# Create resource group

resource "azurerm_resource_group" "resource_group" {
    name = var.resource_group_Name
    location = var.location
  
}