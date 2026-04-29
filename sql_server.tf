# create sql server

/*resource "azurerm_mssql_server" "prod-sql_server" {
  name                         = "prodsqlserver"
  resource_group_name          = azurerm_resource_group.resource_group.name
  location                     = azurerm_resource_group.resource_group.location
  version                      = "12.0"
  administrator_login          = "Example-Administrator"
  administrator_login_password = "Example_Password!"
  minimum_tls_version          = "1.2"
  
}*/