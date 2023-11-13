terraform {
  # 1. Required Version Terraform
  required_version = ">= 1.4.0"
  # 2. Required Terraform Providers  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.0"
    }
  }


}

provider "azurerm" {

  subscription_id = "3519f411-c499-467c-9bb1-db8f40bfe53d"
  client_id = "7459662a-f90a-43c9-9913-d718042767ee"
  client_secret = "kVK8Q~K4TKTgOPN~iwqBpcHpTkuyHi4CEmV2Ybzn"
  tenant_id = "20f7416e-5525-4127-9df1-18a5d531c1b6"
  features {}
}