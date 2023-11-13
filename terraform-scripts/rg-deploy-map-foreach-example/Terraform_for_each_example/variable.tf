variable "rgs" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  default = {
    "first" = {
      name     = "first_rg"
      location = "west us"
      tags = {
        "owner"    = "vcloud-lab.com"
        "downtime" = "afternoon"
      }
    },
    "second" = {
      name     = "second_rg"
      location = "east us"
      tags = {
        "owner"    = "vJanvi"
        "downtime" = "morning"
      }
    }
  }
}