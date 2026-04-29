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



