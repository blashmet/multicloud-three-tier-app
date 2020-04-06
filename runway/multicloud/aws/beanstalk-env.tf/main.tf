#VARIABLES

  #LOCATION
  variable "region" {}
  variable "environment" {}

  #BEANSTALK CONFIG TEMPLATE
  variable "instance_type" {}
  variable "solution_stack_name" {}
  variable "rds_secret_stack_name" {}

  #REMOTE STATE
  variable "tf_state_vpc_bucket_name" {}
  variable "tf_state_vpc_key_name" {}
  variable "tf_state_rds_bucket_name" {}
  variable "tf_state_rds_key_name" {}
  variable "tf_state_beanstalk_app_bucket_name" {}
  variable "tf_state_beanstalk_app_key_name" {}
  variable "tf_state_security_groups_bucket_name" {}
  variable "tf_state_security_groups_key_name" {}
  variable "tf_state_iam_roles_bucket_name" {}
  variable "tf_state_iam_roles_key_name" {}
  variable "terraform_demo_ec2_keypair_name" {}


#PROVIDER
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

#BACKEND
terraform {
  backend "s3" {
    key = "beanstalk-env.tfstate"
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

data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket = var.tf_state_rds_bucket_name
    key = var.tf_state_rds_key_name
    region = var.region
  }
}

data "terraform_remote_state" "beanstalk_app" {
  backend = "s3"
  config = {
    bucket = var.tf_state_beanstalk_app_bucket_name
    key = var.tf_state_beanstalk_app_key_name
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

data "terraform_remote_state" "iam_roles" {
  backend = "s3"
  config = {
    bucket = var.tf_state_iam_roles_bucket_name
    key = var.tf_state_iam_roles_key_name
    region = var.region
  }
}

#DATA

data "aws_cloudformation_stack" "rds_secret_stack" {

  name = var.rds_secret_stack_name

}


data "aws_secretsmanager_secret_version" "rds_secret" {

  secret_id = data.aws_cloudformation_stack.rds_secret_stack.outputs["RDSSecretName"]

}

#RESOURCES

resource "aws_elastic_beanstalk_configuration_template" "beanstalk_config_template" {

  name = "terraform-demo-${var.region}-${var.environment}-config"
  application = data.terraform_remote_state.beanstalk_app.outputs.arn
  solution_stack_name = var.solution_stack_name


  setting {

    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = data.terraform_remote_state.vpc.outputs.vpc_id

  }

  setting {

    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = "${data.terraform_remote_state.vpc.outputs.pri_sub_1_id}, ${data.terraform_remote_state.vpc.outputs.pri_sub_2_id}" 

  }

  setting {

    namespace = "aws:ec2:vpc"
    name = "AssociatePublicIpAddress"
    value = "false"

  }

  setting {

    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = data.terraform_remote_state.iam_roles.outputs.ec2_role_id
    
  }

  setting {

    namespace = "aws:autoscaling:launchconfiguration"
    name = "SecurityGroups"
    value = data.terraform_remote_state.security_groups.outputs.ec2_sg_id

  }

  setting {

    namespace = "aws:autoscaling:launchconfiguration"
    name = "EC2KeyName"
    value = var.terraform_demo_ec2_keypair_name

  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = var.instance_type
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "ServiceRole"
    value = "aws-elasticbeanstalk-service-role"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBScheme"
    value = "public"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBSubnets"
    value = "${data.terraform_remote_state.vpc.outputs.pub_sub_1_id}, ${data.terraform_remote_state.vpc.outputs.pub_sub_2_id}"
  }

  setting {
    namespace = "aws:elb:loadbalancer"
    name = "CrossZone"
    value = "true"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSize"
    value = "30"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSizeType"
    value = "Percentage"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name = "Availability Zones"
    value = "Any 2"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name = "MinSize"
    value = "1"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "RollingUpdateType"
    value = "Health"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_USERNAME"
    value = jsondecode(data.aws_secretsmanager_secret_version.rds_secret.secret_string)["username"]
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_PASSWORD"
    value = jsondecode(data.aws_secretsmanager_secret_version.rds_secret.secret_string)["password"]
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_DATABASE"
    value = "mydb"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_HOSTNAME"
    value =  data.terraform_remote_state.rds.outputs.address
  }

}


resource "aws_elastic_beanstalk_application_version" "application_version" {

  name        = "terraform-demo-${var.environment}"
  application = data.terraform_remote_state.beanstalk_app.outputs.name
  description = "Application version managed by Terraform"
  bucket      = "aws-${var.region}-s3-bucket"
  key         = "dotnet-blue.zip"

}

resource "aws_elastic_beanstalk_environment" "beanstalk_env" {

  name                = "terraform-demo-${var.environment}"

  application         = data.terraform_remote_state.beanstalk_app.outputs.name

  template_name       = aws_elastic_beanstalk_configuration_template.beanstalk_config_template.name

}