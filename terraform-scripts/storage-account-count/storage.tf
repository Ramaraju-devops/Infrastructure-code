
module "stracctdep1" {
  
  source = "./modules/storage-account"
  storage_acct_name = "${var.storage_acct_name}"
  rgname = "${azurerm_resource_group.rgdeploy01.name}"
  location = "${var.location}"
}

module "stracctdep2" {
  count = 2
  source = "./modules/storage-account"
  storage_acct_name = "${var.storage_acct_name2}${count.index + 1}"
  rgname = "${data.azurerm_resource_group.existrg01.name}"
  location = "${var.location}"
}

module "stracctdep3" {
  
  source = "./modules/storage-account"
  storage_acct_name = "${var.storage_acct_name3}"
  rgname = "${azurerm_resource_group.rgdeploy01.name}"
  location = "${var.location}"
}


