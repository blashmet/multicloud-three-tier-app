# Variable definitions

variable "region" {}
variable "vpc_cidr" {}
variable "pub_sub_1_cidr" {}
variable "pub_sub_2_cidr" {}
variable "pri_sub_1_cidr" {}
variable "pri_sub_2_cidr" {}


# Provider and access setup

provider "aws" {
  version = "~> 2.0"
  region = var.region
}

# Backend setup

terraform {
  backend "s3" {
    key = "vpc.tfstate"
  }
}

# Resources

resource "aws_vpc" "vpc" {

  cidr_block       = var.vpc_cidr  
  instance_tenancy = "dedicated"

  tags = {
    Name = "vpc-${var.region}"
  }

}

resource "aws_subnet" "pub-sub-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_sub_1_cidr

  tags = {
    Name = "pub-sub-1-${var.region}"
  }
}

resource "aws_subnet" "pub-sub-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_sub_2_cidr

  tags = {
    Name = "pub-sub-2-us-east-1"
  }
}

resource "aws_subnet" "pri-sub-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pri_sub_1_cidr

  tags = {
    Name = "pri-sub-1-${var.region}"
  }
}

resource "aws_subnet" "pri-sub-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pri_sub_2_cidr

  tags = {
    Name = "pri-sub-2-${var.region}"
  }
}