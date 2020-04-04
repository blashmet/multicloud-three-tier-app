#VARIABLES
variable "region" {}
variable "environment" {}
variable "tf_state_iam_roles_bucket_name" {}
variable "tf_state_iam_roles_key_name" {}


#PROVIDER
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

#BACKEND
terraform {
  backend "s3" {
    key = "security-groups.tfstate"
  }
}

#REMOTE
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.tf_state_vpc_bucket_name
    key = var.tf_state_vpc_key_name
    region = var.region
  }
}

#RESOURCES

data "aws_iam_role" "beanstalk_role" {

  name = "aws-elasticbeanstalk-service-role"

}

data "aws_iam_role" "ec2_role" {

  name = "aws-elasticbeanstalk-service-role"

}