module "fir_api" {
  source = "../../modules/apim-api"

  name                = "iels-fir-api"
  display_name        = "IELS FIR Manager API"
  path                = "fir"

  resource_group_name = "rg-iels-dev"
  api_management_name = module.apim.name

  backend_url = "https://ca-iels-fir-dev.proudbeach-d843795d.uksouth.azurecontainerapps.io"

  openapi_file = "${path.module}/../../apis/fir-manager/openapi.json"
}