# Windows VM Module

This Terraform module creates a single Windows Virtual Machine in Azure, along with its associated Network Interface.

## Features

- Creates a Windows Server 2022 VM with Premium LRS OS disk
- Automatically provisions a Network Interface with dynamic private IP allocation
- Configurable VM sizes, credentials, environments, and tags

## Requirements

- Terraform >= 1.0
- AzureRM provider >= 4.0

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| vm_name | Name of the Windows VM | `string` | n/a | yes |
| resource_group_name | Name of the resource group | `string` | n/a | yes |
| location | Azure region for resources | `string` | n/a | yes |
| vm_size | VM size/SKU | `string` | `"Standard_B2s"` | no |
| admin_username | Administrator username | `string` | n/a | yes |
| admin_password | Administrator password | `string` | n/a | yes |
| subnet_id | Subnet ID where VM will be placed | `string` | n/a | yes |
| environment | Environment tag (dev, prod, etc) | `string` | `"dev"` | no |
| tags | Resource tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| vm_id | The ID of the Windows VM |
| vm_name | The name of the Windows VM |
| private_ip_address | Private IP address of the VM |
| network_interface_id | The ID of the network interface |

## Usage

```hcl
module "windowsvm" {
  source = "./modules/windowsvm"

  vm_name             = "my-windows-vm"
  resource_group_name = "my-resource-group"
  location            = "East US"
  vm_size             = "Standard_B2s"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd1234!"
  subnet_id           = azurerm_subnet.app.id
  environment         = "prod"
  tags = {
    Owner      = "DevOps"
    Project    = "WebApp"
    CostCenter = "IT"
  }
}
```

## Notes

- The module creates one NIC per VM with a single IP configuration using dynamic private IP allocation.
- VM names must be unique within the resource group.
- Admin passwords should follow Azure complexity requirements.
- The module uses Windows Server 2022 Datacenter edition by default.
- All resources are tagged with the provided tags plus an "Environment" tag.
- For production use, consider using Azure Key Vault for storing admin credentials instead of plain text.