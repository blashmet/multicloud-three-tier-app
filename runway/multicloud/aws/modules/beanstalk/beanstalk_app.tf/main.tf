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
# data "aws_iam_role" "beanstalk_role" {

#   name = "aws-elasticbeanstalk-service-role"

# }

# data "aws_iam_role" "ec2_role" {

#   name = "aws-elasticbeanstalk-ec2-role"

# }


data "aws_iam_policy" "admin_policy" {

  arn = "arn:aws:iam::aws:policy/AdministratorAccess"

}

data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]



    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "beanstalk_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values = [
        "elasticbeanstalk",
      ]
    }

    principals {
      type        = "Service"
      identifiers = ["elasticbeanstalk.amazonaws.com"]
    }
  }
}







resource "aws_iam_role" "beanstalk_ec2_instance_role" {

  name               = var.beanstalk_ec2_instance_role_name
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json

}

resource "aws_iam_role" "beanstalk_service_role" {

  name               = var.beanstalk_service_role_name
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.beanstalk_assume_role_policy.json

}

resource "aws_iam_role_policy_attachment" "ec2_role_attachment" {

  role       = aws_iam_role.beanstalk_ec2_instance_role.name
  policy_arn = data.aws_iam_policy.admin_policy.arn

}

resource "aws_iam_role_policy_attachment" "beanstalk_role_attachment" {

  role       = aws_iam_role.beanstalk_service_role.name
  policy_arn = data.aws_iam_policy.admin_policy.arn

}

resource "aws_iam_instance_profile" "beanstalk_ec2_instance_profile" {

  name = var.beanstalk_ec2_instance_profile_name
  role = aws_iam_role.beanstalk_ec2_instance_role.name

}

resource "aws_elastic_beanstalk_application" "beanstalk_app" {

  name        = var.application_name 

  description = "Application managed by Terraform"

  appversion_lifecycle {
    
    service_role          = aws_iam_role.beanstalk_service_role.arn
    max_count             = 5
    delete_source_from_s3 = true

  }
  
}