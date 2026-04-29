variable "vm_name" {
  type        = string
  description = "Name of the Windows VM"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
}

variable "vm_size" {
  type        = string
  description = "VM size/SKU"
  default     = "Standard_B2s"
}

variable "admin_username" {
  type        = string
  description = "Administrator username"
  sensitive   = true
}

variable "admin_password" {
  type        = string
  description = "Administrator password"
  sensitive   = true
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where VM will be placed"
}

variable "environment" {
  type        = string
  description = "Environment tag (dev, prod, etc)"
  default     = "dev"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}
