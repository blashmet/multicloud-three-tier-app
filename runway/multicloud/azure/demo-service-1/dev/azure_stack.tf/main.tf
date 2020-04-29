#VARIABLES
variable "resource_group_name" {}
variable "region" {}
variable "vnet_address_space" {}
variable "vnet_name" {}

#PROVIDERS



#BACKEND
terraform {
  backend "s3" {
    key = "azure-stack.tfstate"
  }
}

#MODULE CALLS
module "azure_stack" {

  source = "../../../modules/azure/azure_stack.tf"
  resource_group_name = var.resource_group.name
  location = var.region
  vnet_address_space = var.vnet_address_space
  vnet_name = var.vnet_name

}