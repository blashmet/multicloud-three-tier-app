# VARIABLES
variable "region" {}
variable "environment" {}
variable "tf_state_vpc_bucket_name" {}
variable "tf_state_vpc_key_name" {}

# PROVIDER
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

#BACKEND
terraform {
  backend "s3" {
    key = "gateways-qa.tfstate"
  }
}

# RESOURCES
module "gateways" {

  source = "../../../modules/network/gateways.tf"

    region = var.region
    environment = var.environment
    tf_state_vpc_bucket_name = var.tf_state_vpc_bucket_name
    tf_state_vpc_key_name = var.tf_state_vpc_key_name

}