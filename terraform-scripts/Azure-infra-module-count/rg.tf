resource "azurerm_resource_group" "rgdeploy1" {
    name = "${var.rgname01}"
    location = "${var.location}"
    tags = {
        env = "testing"
        owner = "rama"
    }
}

resource "azurerm_resource_group" "rgdeploy2" {
    name = "${var.rgname02}"
    location = "${var.location}"
      tags = {
        env = "testing2"
        owner = "rama"
    }
}

