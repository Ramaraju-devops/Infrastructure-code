provider "azurerm" {
  features {}
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  tenant_id = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}" 
}


# provider "azurerm" {
#   features {}
#   client_id = "d77de4af-c59b-474b-b17a-e02ffe77943d"
#   client_secret = "dUO8Q~1Hh5yCUQCk.x.xa0oZYCu0iB5z~fXZadel"
#   tenant_id = "84f96efe-d3ca-47a5-bc04-8d455c1e0e15"
#   subscription_id = "13917d14-a7e0-4435-8830-403a28246744" 
# }