
# Azure Resource Group Name
variable "rgname" {
  type = string
  description = "This variable defines the Resource Group"
  default = "xyz-terraform-rg-demo"
}

# Azure Location
variable "location" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "west europe"
}


