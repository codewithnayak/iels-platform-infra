
resource "azurerm_log_analytics_workspace" "iels" {
  name                = "log-iels-dev"
  location            = "uksouth"
  resource_group_name = "rg-iels-dev"

  sku               = "PerGB2018"
  retention_in_days = 30

  tags = {
    environment = "dev"
    project     = "IELS"
    managed_by  = "terraform"
  }
}


resource "azurerm_container_app_environment" "iels" {
  name                       = "cae-iels-dev"
  location                   = "uksouth"
  resource_group_name        = "rg-iels-dev"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.iels.id

  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }

  tags = {
    environment = "dev"
    project     = "IELS"
    managed_by  = "terraform"
  }
}

