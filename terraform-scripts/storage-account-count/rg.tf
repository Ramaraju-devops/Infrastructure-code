
resource "azurerm_resource_group" "rgdeploy01" {
    name = "${var.rgname1}"
    location = "${var.location}"
     tags = {
    owner = "rama"
    environment = "testing"
  }
  
}


# resource "azurerm_resource_group" "rgdeploy02" {
#     name = "${var.rgname2}"
#     location = "${var.location}"
# }

