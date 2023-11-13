# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example_rg" {
  for_each = var.rgs
  name     = each.value["name"]
  location = each.value["location"]
  tags     = each.value["tags"]
} 