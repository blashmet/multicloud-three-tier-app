#PROVIDER
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

#BACKEND
terraform {
  backend "s3" {
    key = "beanstalk-app.tfstate"
  }
}

#REMOTE STATE
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

resource "aws_elastic_beanstalk_application" "beanstalk_app" {

  name        = var.application_name 

  description = "Application managed by Terraform"

  appversion_lifecycle {
    
    service_role          = data.aws_iam_role.beanstalk_role.arn
    max_count             = 5
    delete_source_from_s3 = true

  }
  
}