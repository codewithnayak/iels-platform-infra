terraform {
  required_version = ">= 1.10.0, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-iels-tfstate"
    storage_account_name = "stielstfe7fea319c0"
    container_name       = "tfstate"
    key                  = "fir/dev/terraform.tfstate"

    use_azuread_auth = true
    use_oidc         = true
  }
}