#VARIABLES
variable "region" {}
variable "environment" {}
variable "tf_state_vpc_bucket_name" {}
variable "tf_state_vpc_key_name" {}
variable "tf_state_iam_roles_bucket_name" {}
variable "tf_state_iam_roles_key_name" {}

#BACKEND
terraform {
  backend "s3" {
    key = "iam-roles.tfstate"
  }
}

#RESOURCES

module iam_roles {

source = "../../../modules/security/iam-roles.tf"

  region = var.region
  environment = var.environment
  tf_state_vpc_bucket_name = var.tf_state_vpc_bucket_name
  tf_state_vpc_key_name = var.tf_state_vpc_key_name
  tf_state_iam_roles_bucket_name = var.tf_state_iam_roles_bucket_name
  tf_state_iam_roles_key_name = var.tf_state_iam_roles_key_name

}