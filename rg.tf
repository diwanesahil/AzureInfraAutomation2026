# Create resource group

resource "azurerm_resource_group" "resource_group" {
        
    name = format("%s-rg", var.resource_group_Name)
    location = var.location
    tags = local.tags
    }