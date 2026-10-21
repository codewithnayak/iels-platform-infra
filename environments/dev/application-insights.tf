resource "azurerm_application_insights" "fir" {
  name                = "appi-iels-fir-dev"
  location            = azurerm_resource_group.iels.location
  resource_group_name = azurerm_resource_group.iels.name

  application_type = "web"

  workspace_id = azurerm_log_analytics_workspace.iels.id

  daily_data_cap_in_gb = 1

  tags = {
    environment = "dev"
    project     = "IELS"
    managed_by  = "terraform"
  }
}