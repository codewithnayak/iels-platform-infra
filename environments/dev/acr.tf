
resource "azurerm_container_registry" "fir" {
  name                = "acrielsfirdev"
  resource_group_name = "rg-iels-dev"
  location            = "uksouth"

  sku           = "Basic"
  admin_enabled = false

  tags = {
    Environment = "dev"
    Project     = "IELS"
    ManagedBy   = "Terraform"
  }
}
