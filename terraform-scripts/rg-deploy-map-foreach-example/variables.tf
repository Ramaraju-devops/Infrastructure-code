
# Azure Resource Group Name
variable "rgname" {
  type = map(string)
}


# Azure Location
variable "rglocation" {
  type = string
  default = "west europe"
}

variable "tags" {
  type = map(string)
}
 
