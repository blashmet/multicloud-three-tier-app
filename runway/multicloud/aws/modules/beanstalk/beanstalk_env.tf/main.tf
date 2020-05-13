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

# data "terraform_remote_state" "rds" {
#   backend = "s3"
#   config = {
#     bucket = var.tf_state_rds_bucket_name
#     key = var.tf_state_rds_key_name
#     region = var.region
#   }

#   defaults = {
  
#     rds_endpoint = ""
#     rds_username = ""

#   }


# }

data "terraform_remote_state" "beanstalk_app" {
  backend = "s3"
  config = {
    bucket = var.tf_state_beanstalk_app_bucket_name
    key = var.tf_state_beanstalk_app_key_name
    region = var.region
  }

  defaults = {

    beanstalk_app_arn = ""
    beanstalk_app_name = ""
    

  }
}

data "terraform_remote_state" "security_groups" {
  backend = "s3"
  config = {
    bucket = var.tf_state_security_groups_bucket_name
    key = var.tf_state_security_groups_key_name
    region = var.region
  }

  defaults = {

    elb_sg_id = ""
    ec2_sg_id = ""
    rds_sg_id = ""
    jenkins_sg_id = ""
    
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

  name = var.beanstalk_config_template_name
  application = data.terraform_remote_state.beanstalk_app.outputs.beanstalk_app_name
  solution_stack_name = var.solution_stack_name


  setting {

    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = data.terraform_remote_state.vpc.outputs.vpc_id

  }

  setting {

    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = "${data.terraform_remote_state.vpc.outputs.pub_sub_1_id}, ${data.terraform_remote_state.vpc.outputs.pub_sub_2_id}" 

  }

    setting {
    namespace = "aws:ec2:vpc"
    name = "ELBSubnets"
    value = "${data.terraform_remote_state.vpc.outputs.pub_sub_1_id}, ${data.terraform_remote_state.vpc.outputs.pub_sub_2_id}"
  }

  
  setting {
    namespace = "aws:elasticbeanstalk:xray"
    name = "XRayEnabled"
    value = "true"
  }

    setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name = "SystemType"
    value = "enhanced"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name = "MinSize"
    value = "1"
  }

  
  setting {
    namespace = "aws:autoscaling:asg"
    name = "MaxSize"
    value = "2"
  }

  setting {

    namespace = "aws:autoscaling:launchconfiguration"
    name = "SecurityGroups"
    value = data.terraform_remote_state.security_groups.outputs.ec2_sg_id

  }

  setting {

    namespace = "aws:autoscaling:launchconfiguration"
    name = "EC2KeyName"
    value = var.aws_terraform_demo_ec2_keypair_name

  }

    setting {

    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = var.beanstalk_ec2_instance_profile_name

  }



  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = var.instance_type
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "ServiceRole"
    value = var.beanstalk_service_role_name
  }

    setting {
    namespace = "aws:elb:loadbalancer"
    name = "SecurityGroups"
    value = data.terraform_remote_state.security_groups.outputs.elb_sg_id
  }

  setting {
    namespace = "aws:elb:loadbalancer"
    name = "ManagedSecurityGroup"
    value = data.terraform_remote_state.security_groups.outputs.elb_sg_id
  }


  setting {
    namespace = "aws:elb:loadbalancer"
    name = "CrossZone"
    value = "true"
  }


  #setting {
    #namespace = "aws:elasticbeanstalk:application:environment"
    #name = "RDS_USERNAME"
    #value = jsondecode(data.aws_secretsmanager_secret_version.rds_secret.secret_string)["username"]
  #}

  #setting {
    #namespace = "aws:elasticbeanstalk:application:environment"
    #name = "RDS_PASSWORD"
    #value = jsondecode(data.aws_secretsmanager_secret_version.rds_secret.secret_string)["password"]
  #}

  #setting {
    #namespace = "aws:elasticbeanstalk:application:environment"
    #name = "RDS_DATABASE"
    #value = "mydb"
  #}

  # setting {
  #   namespace = "aws:elasticbeanstalk:application:environment"
  #   name = "RDS_HOSTNAME"
  #   value =  data.terraform_remote_state.rds.outputs.rds_endpoint
  # }

}


resource "aws_elastic_beanstalk_application_version" "application_version" {

  name        = var.beanstalk_app_version_name
  application = data.terraform_remote_state.beanstalk_app.outputs.beanstalk_app_name
  description = var.beanstalk_app_version_description
  bucket      = var.beanstalk_app_version_source_bucket_name
  key         = var.beanstalk_app_version_source_bucket_key_name

}


resource "aws_elastic_beanstalk_environment" "beanstalk_env" {

  name                = var.beanstalk_environment_name

  application         = data.terraform_remote_state.beanstalk_app.outputs.beanstalk_app_name

  template_name       = aws_elastic_beanstalk_configuration_template.beanstalk_config_template.name

  version_label       = var.beanstalk_app_version_name

}