data "azurerm_resource_group" "contoso_rg" {
    name = "contoso"
}

data "azurerm_log_analytics_workspace" "law" {
  name = var.law 
  resource_group_name = data.azurerm_resource_group.contoso_rg.name
}