
# Azure Resource Group Name
variable "rgname" {
  type = string
  description = "This variable defines the Resource Group"
  default = "dem-ci-tf-rg-01"
}

# Azure Location
variable "location" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "west europe"
}


