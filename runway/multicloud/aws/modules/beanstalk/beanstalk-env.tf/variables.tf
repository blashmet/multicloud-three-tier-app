#NAMESPACE
variable "region" {}
variable "environment" {}
#REMOTE STATE
variable "rds_secret_stack_name" {}
variable "tf_state_vpc_bucket_name" {}
variable "tf_state_vpc_key_name" {}
variable "tf_state_rds_bucket_name" {}
variable "tf_state_rds_key_name" {}
variable "tf_state_beanstalk_app_bucket_name" {}
variable "tf_state_beanstalk_app_key_name" {}
variable "tf_state_iam_roles_bucket_name" {}
variable "tf_state_iam_roles_key_name" {}
variable "tf_state_security_groups_bucket_name" {}
variable "tf_state_security_groups_key_name" {}
#BEANSTALK SOURCE
variable "beanstalk_app_version_name" {}
variable "beanstalk_app_version_description" {}
variable "beanstalk_app_version_source_bucket_name" {}
variable "beanstalk_app_version_source_bucket_key_name" {}
#BEANSTALK CONFIG TEMPLATE (ENVIRONMENT)
variable "application_name" {}
variable "solution_stack_name" {}
variable "beanstalk_app_version_description" {}
variable "beanstalk_app_version_source_bucket_name" {}
variable "beanstalk_app_version_source_bucket_key_name" {}