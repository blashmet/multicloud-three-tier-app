#VARIABLES
variable "region" {}
variable "environment" {}
variable "db_instance_identifier" {}
variable "allocated_storage" {}
variable "storage_type" {}
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "name" {}
variable "username" {}
variable "password" {}
variable "parameter_group_name" {}
variable "subnet_group_name" {}
variable "tf_state_vpc_bucket_name" {}
variable "tf_state_vpc_key_name" {}
variable "tf_state_secrets_bucket_name" {}
variable "tf_state_secrets_key_name" {}
variable "tf_state_security_groups_bucket_name" {}
variable "tf_state_security_groups_key_name" {}


#PROVIDER
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

#BACKEND
terraform {
  backend "s3" {
    key = "elasticache-redis-dev.tfstate"
  }
}

#RESOURCES
module "elasticache_redis" {

  source = "../../../modules/data/elasticache_redis.tf"

    region = var.region
    environment = var.environment
    db_instance_identifier = var.db_instance_identifier
    allocated_storage = var. allocated_storage
    storage_type = var.storage_type
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    name = var.name
    username = var.username
    password = var.password
    parameter_group_name = var.parameter_group_name
    subnet_group_name = var.subnet_group_name
    tf_state_vpc_bucket_name = var.tf_state_vpc_bucket_name
    tf_state_vpc_key_name = var.tf_state_vpc_key_name
    tf_state_secrets_bucket_name = var.tf_state_secrets_bucket_name
    tf_state_secrets_key_name = var.tf_state_secrets_key_name
    tf_state_security_groups_bucket_name = var.tf_state_security_groups_bucket_name
    tf_state_security_groups_key_name = var.tf_state_security_groups_key_name

}