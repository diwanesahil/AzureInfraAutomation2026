# create azure storage account
locals {
  storage_accounts = {
    sa1 = "stgaccounts"
    sa2 = "stgaccounts"
  }
}

resource "random_string" "random" {
  length           = 8
  special          = false
  lower = true
  upper = false
  numeric = true
}


resource "azurerm_storage_account" "storage_accounts" {
for_each = local.storage_accounts
    name = "${each.value}${random_string.random.result}"
    resource_group_name = azurerm_resource_group.resource_group.name
    location = azurerm_resource_group.resource_group.location
    account_tier = "Standard"
    account_replication_type = "LRS"

  
}