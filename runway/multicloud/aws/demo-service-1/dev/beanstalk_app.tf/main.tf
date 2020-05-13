#VARIABLES
variable "region" {}
variable "environment" {}
variable "tf_state_vpc_bucket_name" {}
variable "tf_state_vpc_key_name" {}
variable "application_name" {}
variable "beanstalk_service_role_name" {}
variable "beanstalk_ec2_instance_profile_name" {}
variable "beanstalk_ec2_instance_role_name" {}



#PROVIDER
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

#BACKEND
terraform {
  backend "s3" {
    key = "beanstalk-app-dev.tfstate"
  }
}

#RESOURCES
module beanstalk_app {

  source = "../../../modules/beanstalk/beanstalk_app.tf"

    region = var.region
    environment = var.environment
    application_name = var.application_name
    tf_state_vpc_bucket_name = var.tf_state_vpc_bucket_name
    tf_state_vpc_key_name = var.tf_state_vpc_key_name
    beanstalk_service_role_name = var.beanstalk_service_role_name
    beanstalk_ec2_instance_profile_name = var.beanstalk_ec2_instance_profile_name
    beanstalk_ec2_instance_role_name = var.beanstalk_ec2_instance_role_name

}