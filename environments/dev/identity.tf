resource "azurerm_user_assigned_identity" "fir" {
  name                = "id-iels-fir-dev"
  resource_group_name = "rg-iels-dev"
  location            = "uksouth"

  tags = {
    Environment = "dev"
    Project     = "IELS"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_role_assignment" "fir_acr_pull" {
  scope                = azurerm_container_registry.fir.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.fir.principal_id
}