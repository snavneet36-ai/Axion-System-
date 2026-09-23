resource "azurerm_postgresql_flexible_server" "postgres" {
    for_each = var.postgresql_server
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name 
  location               = each.value.location
  public_network_access_enabled = true
  version                = "16"
  administrator_login    = each.value.administrator_login
  administrator_password = each.value.administrator_password

  storage_mb   = 32768
  sku_name     = "B_Standard_B1ms"
  zone         = "1"

  backup_retention_days = 7
}