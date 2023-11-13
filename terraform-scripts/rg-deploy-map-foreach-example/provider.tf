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
    resource_group_name   = "mytestrg01"
    storage_account_name  = "tststracctoct2302"
    container_name        = "terraformstate"
    key                   = "testterramap1.tfstate"
  } 
}

# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  client_secret = "f9q8Q~cmBVIhR-SUmXZUrz~pPOU_yT1wnkS3faNf"
  client_id = "7582882e-1f8f-43ac-bc07-cc448eb13f3b"
  subscription_id = "13917d14-a7e0-4435-8830-403a28246744"
  tenant_id = "84f96efe-d3ca-47a5-bc04-8d455c1e0e15"

  features {}
}



