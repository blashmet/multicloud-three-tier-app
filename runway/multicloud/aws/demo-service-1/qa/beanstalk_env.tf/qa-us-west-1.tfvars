region = "us-west-1"
environment = "qa"
rds_secret_stack_name = "aws-us-west-1-qa-rds-secret"

tf_state_vpc_bucket_name = "aws-us-west-1-qa-vpc-tf-state-bucket"
tf_state_vpc_key_name = "env:/qa/vpc-qa.tfstate"

tf_state_rds_bucket_name = "aws-us-west-1-qa-rds-tf-state-bucket"
tf_state_rds_key_name = "env:/qa/rds-qa.tfstate"

tf_state_beanstalk_app_bucket_name = "aws-us-west-1-qa-beanstalk-app-tf-state-bucket"
tf_state_beanstalk_app_key_name = "env:/qa/beanstalk-app-qa.tfstate"

tf_state_security_groups_bucket_name = "aws-us-west-1-qa-security-groups-tf-state-bucket"
tf_state_security_groups_key_name = "env:/qa/security-groups-qa.tfstate"


#BEANSTALK APPLICATION VERSION
beanstalk_app_version_name = "aws-us-west-1-qa-terraform-demo-config"
beanstalk_app_version_description = "Application version managed by Terraform"
beanstalk_app_version_source_bucket_name = "aws-us-west-1-qa-beanstalk-source-bucket"
beanstalk_app_version_source_bucket_key_name = "dotnet-blue.zip"

#BEANSTALK CONFIG TEMPLATE (ENVIRONMENT)

solution_stack_name = "64bit Windows Server Core 2019 v2.5.2 running IIS 10.0"
aws_terraform_demo_ec2_keypair_name = "aws-us-west-1-qa-terraform-demo-keypair"
instance_type = "m4.large"
beanstalk_config_template_name = "beanstalk_config_template_qa"
beanstalk_environment_name = "terraform-demo-qa"