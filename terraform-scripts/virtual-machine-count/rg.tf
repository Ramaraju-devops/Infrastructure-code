resource "azurerm_resource_group" "testrg3" {
    count = 1
  name = "ajayrg-${count.index+1}"
  location = "eastus2"
  tags = {
    "owner" = "ajay"
    "purpose" = "testing"
   }
}