# Variable definitions

variable "region" {}
variable "tf_state_vpc_bucket_name" {}
variable "tf_state_vpc_key_name" {}
variable "application_name" {}


# Provider and access setup

provider "aws" {
  version = "~> 2.0"
  region = var.region
}

# Backend Config

terraform {
  backend "s3" {
    key = "beanstalk-app.tfstate"
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

# Resources

data "aws_iam_role" "beanstalk_role" {

  name = "aws-elasticbeanstalk-service-role"

}

resource "aws_elastic_beanstalk_application" "beanstalk_app" {

  name        = var.application_name 

  description = "Application managed by Terraform"

  appversion_lifecycle {
    
    service_role          = data.aws_iam_role.beanstalk_role.arn
    max_count             = 5
    delete_source_from_s3 = true

  }
  
}