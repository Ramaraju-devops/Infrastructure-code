resource "azurerm_resource_group" "rgdeploy1" {

  for_each = "${var.rgname}"
  name =   "test-${each.value}"
  location = var.rglocation

  tags= "${var.tags}"
}