#VARIABLES
variable "region" {}
variable "tf_state_vpc_bucket_name" {}
variable "tf_state_vpc_key_name" {}
variable "application_name" {}


#PROVIDER
provider "aws" {
  version = "~> 2.0"
  region = var.region
}


#RESOURCES
module beanstalk_app {

  source = "../../../modules/beanstalk/beanstalk-app.tf"

    region = var.region
    environment = var.environment
    tf_state_vpc_bucket_name = var.tf_state_vpc_bucket_name
    tf_state_vpc_key_name = var.tf_state_vpc_key_name
    tf_state_iam_roles_bucket_name = var.tf_state_iam_roles_bucket_name
    tf_state_iam_roles_key_name = var.tf_state_iam_roles_key_name

}