module "apim" {
  source = "../../modules/apim"

  name                = "apim-iels-dev"
  resource_group_name = "rg-iels-dev"
  location            = "uksouth"

  publisher_name  = "IELS"
  publisher_email = "sekharinweb@gmail.com"

  sku_name = "Consumption_0"

  tags = {
    Environment = "dev"
    Project     = "IELS"
    ManagedBy   = "Terraform"
  }
}

output "apim_gateway_url" {
  value = module.apim.gateway_url
}