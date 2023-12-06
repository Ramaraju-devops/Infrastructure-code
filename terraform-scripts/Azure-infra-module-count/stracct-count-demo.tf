module "stracctdepcount" {
  source = "./modules/storage-account-count"
  numberofstraccts = 4
  stracctname = "${var.stracctcountname}"
  rgname = "${data.azurerm_resource_group.existrgname01.name}" 
  location = "${var.location}"
}
