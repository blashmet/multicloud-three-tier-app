# VARIABLES
variable "region" {}
variable "environment" {}
variable "tf_state_vpc_bucket_name" {}
variable "tf_state_vpc_key_name" {}
variable "tf_state_security_groups_bucket_name" {}
variable "tf_state_security_groups_key_name" {}
variable "keypair_name" {}

# PROVIDER
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

#BACKEND
terraform {
  backend "s3" {
    key = "jenkins-dev.tfstate"
  }
}

# RESOURCES
module "jenkins_ec2" {

  source = "../../../modules/management/jenkins_ec2.tf"

    region = var.region
    keypair_name = var.keypair_name
    tf_state_vpc_bucket_name = var.tf_state_vpc_bucket_name
    tf_state_vpc_key_name = var.tf_state_vpc_key_name
    tf_state_security_groups_bucket_name = var.tf_state_security_groups_bucket_name
    tf_state_security_groups_key_name = var.tf_state_security_groups_key_name

}