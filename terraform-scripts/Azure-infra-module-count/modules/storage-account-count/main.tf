resource "azurerm_storage_account" "stracct-count" {
  count = "${var.numberofstraccts}"

  name                     = "${var.stracctname}${count.index + 1}"
  resource_group_name      = "${var.rgname}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}