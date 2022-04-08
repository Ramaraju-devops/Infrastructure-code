
# 1. Terraform Settings Block
terraform {
  # 1. Required Version Terraform
  required_version = ">= 0.13"
  # 2. Required Terraform Providers  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
   
  }

# Terraform State Storage to Azure Storage Container

  backend "azurerm" {
    resource_group_name   = "terraform-rg"
    storage_account_name  = "terrafromstrgacc1234"
    container_name        = "terraformstate"
    key                   = "rg.tfstate"
  } 
   
}


# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  features {

  }
}

