resource "azurerm_application_insights" "fir" {
  name                = "appi-iels-fir-dev"
  location            = "uksouth"
  resource_group_name = "rg-iels-dev"

  application_type = "web"

  workspace_id = azurerm_log_analytics_workspace.iels.id

  daily_data_cap_in_gb = 1

  tags = {
    environment = "dev"
    project     = "IELS"
    managed_by  = "terraform"
  }
}