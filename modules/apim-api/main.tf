resource "azurerm_api_management_api" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name

  revision     = "1"
  display_name = var.display_name
  path         = var.path
  protocols    = ["https"]

  service_url = var.backend_url

  subscription_required = true

  import {
    content_format = "openapi+json"
    content_value  = file(var.openapi_file)
  }
}