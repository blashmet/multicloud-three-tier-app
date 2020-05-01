#VARIABLES
variable "resource_group_name" {}
variable "location" {}
variable "environment" {}
variable "vnet_name" {}
variable "vnet_address_space" {}
variable "subnet_cidr" {}


#PROVIDERS

provider "azurerm" {

  version = "=2.4.0"

  subscription_id = "bccb3520-01c7-44db-98e0-deaa490233d7"
  client_id       = "885edc4a-ede3-4fdc-a1b9-8a4d66cfaaed"
  client_secret   = "a9798a01-61ca-4741-90ff-089c2c50a5f0"
  tenant_id       = "5a0768c0-1ed7-4834-8317-469fa48fde8a"

  features {}
}

#BACKEND
terraform {
  backend "s3" {
    key = "azure-stack.tfstate"
  }
}

#MODULE CALLS
module "azure_stack" {

  source = "../../../modules/azure/azure_stack.tf"
  resource_group_name = var.resource_group_name
  location = var.location
  environment = var.environment
  vnet_address_space = var.vnet_address_space
  vnet_name = var.vnet_name
  subnet_cidr = var.subnet_cidr

}