# Variable definitions
variable "region" {}
variable "tf_state_vpc_bucket_name" {}
variable "tf_state_vpc_key_name" {}
variable "tf_state_gateways_bucket_name" {}
variable "tf_state_gateways_key_name" {}

# Provider and access setup
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

# Backend Config
terraform {
  backend "s3" {
    key = "routes.tfstate"
  }
}

# Remote State Imports

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.tf_state_vpc_bucket_name
    key = var.tf_state_vpc_key_name
    region = var.region
  }
}

data "terraform_remote_state" "gateways" {
  backend = "s3"
  config = {
    bucket = var.tf_state_gateways_bucket_name
    key = var.tf_state_gateways_key_name
    region = var.region
  }
}

# Resources

resource "aws_route_table" "public-route-table-1" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.terraform_remote_state.gateways.outputs.igw_id
  }

  tags = {
    Name = "public-route-table-1-${var.region}"
  }
}

resource "aws_route_table" "private-route-table-1" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.terraform_remote_state.gateways.outputs.ngw_id
  }

  tags = {
    Name = "private-route-table-1-${var.region}"
  }
}


resource "aws_route_table_association" "public-route-table-association-1" {
  subnet_id      = data.terraform_remote_state.vpc.outputs.pub_sub_1_id
  route_table_id = aws_route_table.public-route-table-1.id
}

resource "aws_route_table_association" "private-route-table-association-1" {
  subnet_id      = data.terraform_remote_state.vpc.outputs.pri_sub_1_id
  route_table_id = aws_route_table.private-route-table-1.id
}