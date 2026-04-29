# Windows VM in Primary VNet
module "primary_windowsvm" {
  source = "./modules/windowsvm"

  vm_name             = var.windowsvm_primary_config.vm_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  vm_size             = var.windowsvm_primary_config.vm_size
  admin_username      = var.windowsvm_primary_config.admin_username
  admin_password      = var.windowsvm_primary_config.admin_password
  environment         = var.windowsvm_primary_config.environment
  tags                = var.windowsvm_primary_config.tags
  subnet_id           = module.primary_vnet.subnet_ids["app"]
}

# Windows VM in Secondary VNet
/*module "secondary_windowsvm" {
  source = "./modules/windowsvm"

  vm_name             = var.windowsvm_secondary_config.vm_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  vm_size             = var.windowsvm_secondary_config.vm_size
  admin_username      = var.windowsvm_secondary_config.admin_username
  admin_password      = var.windowsvm_secondary_config.admin_password
  environment         = var.windowsvm_secondary_config.environment
  tags                = var.windowsvm_secondary_config.tags
  subnet_id           = module.secondary_vnet.subnet_ids["app"]
}*/

# Windows VM in Secondary VNet
module "third_windowsvm" {
  source = "./modules/windowsvm"

  vm_name             = var.windowsvm_third_config.vm_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  vm_size             = var.windowsvm_third_config.vm_size
  admin_username      = var.windowsvm_third_config.admin_username
  admin_password      = var.windowsvm_third_config.admin_password
  environment         = var.windowsvm_third_config.environment
  tags                = var.windowsvm_third_config.tags
  subnet_id           = module.secondary_vnet.subnet_ids["app"]
}

