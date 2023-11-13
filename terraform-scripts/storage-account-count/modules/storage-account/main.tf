resource "azurerm_storage_account" "demostr-mod" {
  name                     = "${var.storage_acct_name}"
  resource_group_name      = "${var.rgname}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}