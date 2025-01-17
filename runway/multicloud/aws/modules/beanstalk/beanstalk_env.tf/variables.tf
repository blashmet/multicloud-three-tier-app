variable "region" {}
variable "environment" {}
variable "rds_secret_stack_name" {}
variable "instance_type" {}
variable "tf_state_vpc_bucket_name" {}
variable "tf_state_vpc_key_name" {}
variable "tf_state_rds_bucket_name" {}
variable "tf_state_rds_key_name" {}
variable "tf_state_beanstalk_app_bucket_name" {}
variable "tf_state_beanstalk_app_key_name" {}
variable "tf_state_security_groups_bucket_name" {}
variable "tf_state_security_groups_key_name" {}
variable "beanstalk_app_version_name" {}
variable "beanstalk_app_version_description" {}
variable "beanstalk_app_version_source_bucket_name" {}
variable "beanstalk_app_version_source_bucket_key_name" {}
variable "beanstalk_environment_name" {}
variable "beanstalk_config_template_name" {}
variable "beanstalk_service_role_name" {}
variable "beanstalk_ec2_instance_profile_name" {}
variable "aws_terraform_demo_ec2_keypair_name" {}
variable "solution_stack_name" {}