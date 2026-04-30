variable "resource_group_Name" {
  type = string

}
variable "location" {
  type = string
}
variable "Virtual-network-name" {
  type = string
}
variable "Virtual-network-name_prod" {
  type = string
}

variable "subscription_id" {
  type = string
}
variable "address_prefixes_appsubnet" {
  type = list(string)
}
variable "address_prefixes_dbsubnet" {
  type = list(string)
}
variable "address_prefixes_appsubnet_secondary" {
  type = list(string)
}
variable "address_prefixes_dbsubnet_secondary" {
  type = list(string)
}
variable "vnet_config" {
  type = map(object({
    address_space = list(string)
  }))
}

variable "primary_vnet_nsg_name" {
  type        = string
  description = "Optional name for the primary VNet network security group"
  default     = null
}

variable "primary_vnet_nsg_security_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  description = "Optional list of security rules for the primary VNet NSG"
  default     = []
}

variable "secondary_vnet_nsg_name" {
  type        = string
  description = "Optional name for the secondary VNet network security group"
  default     = null
}

variable "secondary_vnet_nsg_security_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  description = "Optional list of security rules for the secondary VNet NSG"
  default     = []
}

variable "windowsvm_primary_config" {
  type = object({
    vm_name       = string
    vm_size       = string
    admin_username = string
    admin_password = string
    environment    = string
    tags           = map(string)
  })
  description = "Configuration for primary VNet Windows VM"
}

/*variable "windowsvm_secondary_config" {
  type = object({
    vm_name       = string
    vm_size       = string
    admin_username = string
    admin_password = string
    environment    = string
    tags           = map(string)
  })
  description = "Configuration for secondary VNet Windows VM"
}*/

variable "windowsvm_third_config" {
  type = object({
    vm_name       = string
    vm_size       = string
    admin_username = string
    admin_password = string
    environment    = string
    tags           = map(string)
  })
  description = "Configuration for secondary VNet Windows VM"
}



