#BACKEND
terraform {
  backend "s3" {
    key = "vpc.tfstate"
  }
}

#RESOURCES
resource "aws_vpc" "vpc" {

  cidr_block       = var.vpc_cidr  
  instance_tenancy = "dedicated"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"

  tags = {
    Name = "vpc-${var.region}-${var.environment}"
  }

}

resource "aws_subnet" "pub_sub_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_sub_1_cidr
  availability_zone = var.az_1
  

  tags = {
    Name = "pub-sub-1-${var.region}-${var.environment}"
  }
}

resource "aws_subnet" "pub_sub_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_sub_2_cidr
  availability_zone = var.az_2

  tags = {
    Name = "pub-sub-2-${var.region}-${var.environment}"
  }
}

resource "aws_subnet" "pri_sub_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pri_sub_1_cidr
  availability_zone = var.az_1
  

  tags = {
    Name = "pri-sub-1-${var.region}-${var.environment}"
  }
}

resource "aws_subnet" "pri_sub_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pri_sub_2_cidr
  availability_zone = var.az_2

  tags = {
    Name = "pri-sub-2-${var.region}-${var.environment}"
  }
}