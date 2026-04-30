# VNet Module

This Terraform module creates an Azure Virtual Network, optionally attaches a Network Security Group (NSG), and creates one or more subnets. Each subnet is associated with the same NSG to enforce network security rules.

## Features

- Creates an `azurerm_virtual_network`
- Creates an `azurerm_network_security_group`
- Creates one or more `azurerm_subnet`
- Attaches the NSG to each subnet using `azurerm_subnet_network_security_group_association`
- Exposes VNet, subnet, and NSG outputs

## Requirements

- Terraform 1.0+
- AzureRM provider 4.0+

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `vnet_name` | Name of the virtual network | `string` | n/a | yes |
| `resource_group_name` | Name of the Azure resource group | `string` | n/a | yes |
| `location` | Azure region for the VNet and NSG | `string` | n/a | yes |
| `address_space` | VNet address space | `list(string)` | n/a | yes |
| `nsg_name` | Optional NSG name. Defaults to `${var.vnet_name}-nsg` when not set | `string` | `null` | no |
| `nsg_security_rules` | Optional security rules for the NSG | `list(object({ name = string, priority = number, direction = string, access = string, protocol = string, source_port_range = string, destination_port_range = string, source_address_prefix = string, destination_address_prefix = string }))` | `[]` | no |
| `subnets` | Map of subnet definitions keyed by subnet name | `map(object({ address_prefixes = list(string) }))` | `{}` | no |

### Subnets Input Structure

Each subnet entry uses the subnet name as the map key and includes `address_prefixes`:

```hcl
subnets = {
  app = {
    address_prefixes = ["10.0.0.0/24"]
  }
  db = {
    address_prefixes = ["10.0.1.0/24"]
  }
}
```

### NSG Security Rules Structure

Rules are defined as a list of objects:

```hcl
nsg_security_rules = [
  {
    name                       = "Allow-RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
]
```

## Outputs

| Name | Description |
|------|-------------|
| `vnet_id` | ID of the created virtual network |
| `vnet_name` | Name of the created virtual network |
| `subnet_ids` | Map of subnet IDs keyed by subnet name |
| `nsg_id` | ID of the created network security group |

## Usage

```hcl
module "primary_vnet" {
  source              = "./modules/vnet"
  vnet_name           = var.Virtual-network-name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  address_space       = var.vnet_config["primary"].address_space

  nsg_name = "primary-vnet-nsg"
  nsg_security_rules = [
    {
      name                       = "Allow-RDP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    }
  ]

  subnets = {
    app = {
      address_prefixes = ["10.0.0.0/24"]
    }
    db = {
      address_prefixes = ["10.0.1.0/24"]
    }
  }
}
```

## Notes

- The NSG is attached to all subnets created in this module.
- Use `nsg_security_rules` to customize inbound/outbound policy.
- If you do not provide `nsg_name`, the module defaults to `${var.vnet_name}-nsg`.
- Each subnet gets its own `azurerm_subnet_network_security_group_association`.

## Best Practices

- Keep NSG rule priorities unique and ordered.
- Limit `source_address_prefix` wherever possible.
- Avoid using broad rules like `Internet` and `*` unless required.
- Use this module when you need a VNet with subnets and consistent NSG protection.
