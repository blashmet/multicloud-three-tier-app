#VARIABLES
variable state_key {}
variable region {}
variable environment {}
variable vpc_cidr {}
variable pub_sub_1_cidr {}
variable pub_sub_2_cidr {}
variable pri_sub_1_cidr {}
variable pri_sub_2_cidr {}
variable az_1 {}
variable az_2 {}



#PROVIDER
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

#BACKEND
terraform {
  backend "s3" {
    key = var.state_key
  }
}

#MODULE CALLS
module "vpc" {

  source = "../../../modules/network/vpc.tf"

    state_key = var.state_key
    region = var.region
    environment = var.environment
    vpc_cidr = var.vpc_cidr
    pub_sub_1_cidr = var.pub_sub_1_cidr
    pub_sub_2_cidr = var.pub_sub_2_cidr
    pri_sub_1_cidr = var.pri_sub_1_cidr
    pri_sub_2_cidr = var.pri_sub_2_cidr
    az_1 = var.az_1
    az_2 = var.az_2

}