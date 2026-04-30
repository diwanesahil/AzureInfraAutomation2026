variable "vnet_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "nsg_name" {
  type        = string
  default     = null
  description = "Optional Network Security Group name. Defaults to <vnet_name>-nsg if not set."
}

variable "nsg_security_rules" {
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
  default     = []
  description = "Optional list of NSG security rules to add to the network security group."
}

variable "subnets" {
  type = map(object({
    address_prefixes = list(string)
  }))
  default = {}
}