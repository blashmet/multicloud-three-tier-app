# Variable definitions
variable "region" {}
variable "tf_state_vpc_bucket_name" {}
variable "tf_state_vpc_key_name" {}

# Provider and access setup
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

# Backend Config
terraform {
  backend "s3" {
    key = "gateways.tfstate"
  }
}

# Remote State Import
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.tf_state_vpc_bucket_name
    key = var.tf_state_vpc_key_name
    region = var.region
  }
}

# Resources

resource "aws_internet_gateway" "igw" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = {
    Name = "igw-${var.region}"
  }
}

resource "aws_eip" "ngw-eip" {
  vpc      = true
}

resource "aws_nat_gateway" "ngw" {
  
  allocation_id = aws_eip.ngw-eip.id
  subnet_id     = data.terraform_remote_state.vpc.outputs.pub_sub_1_id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "ngw-${var.region}"
  }
}