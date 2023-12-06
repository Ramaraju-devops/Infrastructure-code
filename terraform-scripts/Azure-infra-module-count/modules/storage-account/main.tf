resource "azurerm_storage_account" "stracct-mod" {
 
  name                     = "${var.stracctname}"
  resource_group_name      = "${var.rgname}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}