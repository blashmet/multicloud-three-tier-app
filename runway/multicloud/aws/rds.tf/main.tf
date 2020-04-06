#VARIABLES
variable "region" {}
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
    key = "rds.tfstate"
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

data "terraform_remote_state" "security_groups" {
  backend = "s3"
  config = {
    bucket = var.tf_state_security_groups_bucket_name
    key = var.tf_state_security_groups_key_name
    region = var.region
  }
}


data "aws_cloudformation_stack" "rds_secret_stack" {
  name = "aws-${var.region}-rds-secret"
}


#RESOURCES
resource "aws_db_subnet_group" "rds_subnet_group" {

  subnet_ids = [    
                data.terraform_remote_state.vpc.outputs.pri_sub_1_id,
                data.terraform_remote_state.vpc.outputs.pri_sub_2_id
               ]

  tags = {
    Name = "rds-subnet-group-${var.region}"
  }
}


data "aws_secretsmanager_secret_version" "rds_secret" {

  secret_id = data.aws_cloudformation_stack.rds_secret_stack.outputs["RDSSecretName"]

}

resource "aws_db_instance" "rds" {

  identifier                = var.db_instance_identifier
  allocated_storage         = var.allocated_storage
  storage_type              = var.storage_type
  engine                    = var.engine
  engine_version            = var.engine_version
  instance_class            = var.instance_class
  name                      = var.name
  db_subnet_group_name      = aws_db_subnet_group.rds_subnet_group.id
  parameter_group_name      = var.parameter_group_name
  vpc_security_group_ids    = data.terraform_remote_state.security_groups.outputs.rds_sg_id
  skip_final_snapshot       = true

  username                  = jsondecode(data.aws_secretsmanager_secret_version.rds_secret.secret_string)["username"]
  password                  = jsondecode(data.aws_secretsmanager_secret_version.rds_secret.secret_string)["password"]


    depends_on = [
    aws_db_subnet_group.rds_subnet_group,
  ]


}