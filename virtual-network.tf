module "primary_vnet" {
  source = "./modules/vnet"

  vnet_name           = var.Virtual-network-name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  address_space       = var.vnet_config["primary"].address_space
  nsg_name           = var.primary_vnet_nsg_name
  nsg_security_rules = var.primary_vnet_nsg_security_rules
  subnets = {
    app = {
      address_prefixes = var.address_prefixes_appsubnet
    }
    db = {
      address_prefixes = var.address_prefixes_dbsubnet
    }
  }
}

module "secondary_vnet" {
  source = "./modules/vnet"

  vnet_name           = var.Virtual-network-name_prod
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  address_space       = var.vnet_config["secondary"].address_space
  nsg_name           = var.secondary_vnet_nsg_name
  nsg_security_rules = var.secondary_vnet_nsg_security_rules
  subnets = {
    app = {
      address_prefixes = var.address_prefixes_appsubnet_secondary
    }
    db = {
      address_prefixes = var.address_prefixes_dbsubnet_secondary
    }
  }
}



