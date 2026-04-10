# Create Virtual Network
resource "azurerm_virtual_network" "Production-vnet" {
   name = var.Virtual-network-name
   resource_group_name = azurerm_resource_group.resource_group.name
   location = azurerm_resource_group.resource_group.location
   address_space = var.address_space
   tags = local.tags
  }

  # Create Virtual network Subnet

resource "azurerm_subnet" "websubnet" {
    virtual_network_name = azurerm_virtual_network.Production-vnet.name
    resource_group_name = azurerm_resource_group.resource_group.name
    name = "${var.Virtual-network-name}-websubnet"
    address_prefixes = var.address_prefixes
  
}