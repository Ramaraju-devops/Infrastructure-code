terraform {
  # 2. Required Terraform Providers  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "cloushell-rg"
      storage_account_name = "clousshellauto123"
      container_name       = "terrastatecontainer"
      key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

