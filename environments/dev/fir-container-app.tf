
data "azurerm_container_registry" "iels" {
  name                = "acrielsfirdev"
  resource_group_name = "rg-iels-dev"
}

data "azurerm_user_assigned_identity" "fir" {
  name                = "id-iels-fir-dev"
  resource_group_name = "rg-iels-dev"
}

resource "azurerm_container_app" "fir" {
  name                         = "ca-iels-fir-dev"
  resource_group_name          = "rg-iels-dev"
  container_app_environment_id = azurerm_container_app_environment.iels.id
  revision_mode                = "Single"

  identity {
    type = "UserAssigned"
    identity_ids = [
      data.azurerm_user_assigned_identity.fir.id
    ]
  }

  registry {
    server   = data.azurerm_container_registry.iels.login_server
    identity = data.azurerm_user_assigned_identity.fir.id
  }

  ingress {
    external_enabled = true
    target_port      = 8080

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    min_replicas = 0
    max_replicas = 2

    container {
      name   = "fir-api"
      image  = "${data.azurerm_container_registry.iels.login_server}/iels-fir-api:24"
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  lifecycle {
    ignore_changes = [
      template[0].container[0].image
    ]
  }

  tags = {
    environment = "dev"
    project     = "IELS"
    managed_by  = "terraform"
  }
}
