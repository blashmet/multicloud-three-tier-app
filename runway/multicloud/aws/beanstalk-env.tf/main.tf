# VARIABLES
variable "region" {}
variable "tf_state_vpc_bucket_name" {}
variable "tf_state_vpc_key_name" {}

variable "tf_state_rds_bucket_name" {}
variable "tf_state_rds_key_name" {}

variable "tf_state_beanstalk_app_bucket_name" {}
variable "tf_state_beanstalk_app_key_name" {}

variable "tf_state_security_groups_bucket_name" {}
variable "tf_state_security_groups_key_name" {}

variable "terraform_demo_ec2_keypair_name" {}


#PROVIDER
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

#BACKEND
terraform {
  backend "s3" {
    key = "beanstalk-environment.tfstate"
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


#RESOURCES

resource "aws_elastic_beanstalk_configuration_template" "beanstalk_config_template" {

  name = "terraform-demo-${var.environment}"
  application = data.terraform_remote_state.aws_elastic_beanstalk_application.beanstalk_app.outputs.arn
  solution_stack_name = var.solution_stack_name


  setting {

    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = data.terraform_remote_state.vpc.outputs.vpc_id

  }

  setting {

    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = "${data.terraform_remote_state.vpc.outputs.pri_sub_1_id},    
             ${data.terraform_remote_state.vpc.outputs.pri_sub_2_id}" 

  }

  setting {

    namespace = "aws:ec2:vpc"
    name = "AssociatePublicIpAddress"
    value = "false"

  }

  setting {

    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = data.terraform_remote_state.aws_iam_role.ec2_role.outputs.ec2_role_id
    
  }

  setting {

    namespace = "aws:autoscaling:launchconfiguration"
    name = "SecurityGroups"
    value = data.terraform_remote_state.aws_security_group.ec2.outputs.ec2_sg_id

  }

  setting {

    namespace = "aws:autoscaling:launchconfiguration"
    name = "EC2KeyName"
    value = var.terraform_demo_ec2_keypair_name

  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "t2.micro"
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
    value = data.terraform_remote_state.rds.outputs.username
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_PASSWORD"
    value = "${aws_db_instance.rds-app-prod.password}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_DATABASE"
    value = "mydb"
    value = "${aws_db_instance.rds-app-prod.name}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_HOSTNAME"
    value = "${aws_db_instance.rds-app-prod.endpoint}"
  }

}



}

resource "aws_elastic_beanstalk_environment" "beanstalk-env" {

  name                = "terraform-${var.environment}"

  application         = "${aws_elastic_beanstalk_application.tftest.name}"

  solution_stack_name = "64bit Amazon Linux 2015.03 v2.0.3 running Go 1.4"

}





resource "aws_elastic_beanstalk_application" "beanstalk-app" {

  name        = "terraform-demo"

  description = "Application managed by Terraform"

  appversion_lifecycle {
    
    service_role          = data.aws_iam_role.beanstalk-role.arn
    max_count             = 5
    delete_source_from_s3 = true

  }
}