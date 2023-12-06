
# demo storage account deplyment 
resource "azurerm_storage_account" "stracctdeploy01" {
  name                     = "${var.stracctname01}"
  resource_group_name      = "${azurerm_resource_group.rgdeploy1.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

# demo storage account deplyment using module
module "stracctdeploy02" {
  source = "./modules/storage-account"
  stracctname = "${var.stracctname02}"
  rgname = "${data.azurerm_resource_group.existrgname01.name}" 
  location = "${var.location}"
}

module "stracctdeploy03" {
  source = "./modules/storage-account"
  stracctname = "${var.stracctname03}"
  rgname = "${data.azurerm_resource_group.existrgname01.name}" 
  location = "${var.location}"
}

