#VARIABLES

  #NAMESPACE
  variable "region" {}
  variable "environment" {}

  #BEANSTALK APP VERSION
  variable "beanstalk_app_version_name" {}
  variable "beanstalk_app_version_description" {}
  variable "beanstalk_app_version_source_bucket_name" {}
  variable "beanstalk_app_version_source_bucket_key_name" {}

  #BEANSTALK CONFIG TEMPLATE (ENVIRONMENT)
  variable "instance_type" {}
  variable "solution_stack_name" {}
  variable "rds_secret_stack_name" {}
  variable "beanstalk_config_template_name" {}
  variable "beanstalk_environment_name" {}  

  #REMOTE STATE
  variable "tf_state_vpc_bucket_name" {}
  variable "tf_state_vpc_key_name" {}
  variable "tf_state_rds_bucket_name" {}
  variable "tf_state_rds_key_name" {}
  variable "tf_state_beanstalk_app_bucket_name" {}
  variable "tf_state_beanstalk_app_key_name" {}
  variable "tf_state_security_groups_bucket_name" {}
  variable "tf_state_security_groups_key_name" {}
  variable "aws_terraform_demo_ec2_keypair_name" {}


#PROVIDER
provider "aws" {
  version = "~> 2.0"
  region = var.region
}


#BACKEND
terraform {
  backend "s3" {
    key = "beanstalk-env-dev.tfstate"
  }
}


#RESOURCES
module beanstalk_env {

  source = "../../../modules/beanstalk/beanstalk_env.tf"

    region = var.region
    environment = var.environment
  
    #BEANSTALK APP VERSION
    beanstalk_app_version_name = var.beanstalk_app_version_name
    beanstalk_app_version_description = var.beanstalk_app_version_description
    beanstalk_app_version_source_bucket_name = var.beanstalk_app_version_source_bucket_name
    beanstalk_app_version_source_bucket_key_name = var.beanstalk_app_version_source_bucket_key_name

    #BEANSTALK CONFIG TEMPLATE (ENVIRONMENT)
    instance_type = var.instance_type
    solution_stack_name = var.solution_stack_name
    rds_secret_stack_name = var.rds_secret_stack_name
    beanstalk_config_template_name = var.beanstalk_config_template_name
    beanstalk_environment_name = var.beanstalk_environment_name

    #REMOTE STATE
    tf_state_vpc_bucket_name = var.tf_state_vpc_bucket_name
    tf_state_vpc_key_name = var.tf_state_vpc_key_name
    tf_state_rds_bucket_name = var.tf_state_rds_bucket_name
    tf_state_rds_key_name = var.tf_state_rds_key_name
    tf_state_beanstalk_app_bucket_name = var.tf_state_beanstalk_app_bucket_name
    tf_state_beanstalk_app_key_name = var.tf_state_beanstalk_app_key_name
    tf_state_security_groups_bucket_name = var.tf_state_security_groups_bucket_name
    tf_state_security_groups_key_name = var.tf_state_security_groups_key_name
    aws_terraform_demo_ec2_keypair_name = var.aws_terraform_demo_ec2_keypair_name

}