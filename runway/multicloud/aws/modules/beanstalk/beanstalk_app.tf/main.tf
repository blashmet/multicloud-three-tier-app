#PROVIDER
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

#REMOTE STATE
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.tf_state_vpc_bucket_name
    key = var.tf_state_vpc_key_name
    region = var.region
  }

    defaults = {
    vpc_id = ""
    pub_sub_1_id = ""
    pub_sub_2_id = ""
    pri_sub_1_id = ""
    pri_sub_2_id = ""
  }


}

#RESOURCES
data "aws_iam_role" "beanstalk_role" {

  name = "aws-elasticbeanstalk-service-role"

}

data "aws_iam_role" "ec2_role" {

  name = "aws-elasticbeanstalk-ec2-role"

}

resource "aws_elastic_beanstalk_application" "beanstalk_app" {

  name        = var.application_name 

  description = "Application managed by Terraform"

  appversion_lifecycle {
    
    service_role          = "arn:aws:iam::810041203434:role/aws-elasticbeanstalk-service-role"
    max_count             = 5
    delete_source_from_s3 = true

  }
  
}