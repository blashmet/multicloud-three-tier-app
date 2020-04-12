region = "us-east-2"
environment = "dev"
rds_secret_stack_name = "aws-us-east-2-dev-rds-secret"

tf_state_vpc_bucket_name = "aws-us-east-2-dev-vpc-tf-state-bucket"
tf_state_vpc_key_name = "env:/dev/vpc-dev.tfstate"

tf_state_rds_bucket_name = "aws-us-east-2-dev-rds-tf-state-bucket"
tf_state_rds_key_name = "env:/dev/rds-dev.tfstate"

tf_state_beanstalk_app_bucket_name = "aws-us-east-2-dev-beanstalk-app-tf-state-bucket"
tf_state_beanstalk_app_key_name = "env:/dev/beanstalk-app-dev.tfstate"

tf_state_security_groups_bucket_name = "aws-us-east-2-dev-security-groups-tf-state-bucket"
tf_state_security_groups_key_name = "env:/dev/security-groups-dev.tfstate"


#BEANSTALK APPLICATION VERSION
beanstalk_app_version_name = "aws-us-east-2-dev-terraform-demo-config"
beanstalk_app_version_description = "Application version managed by Terraform"
beanstalk_app_version_source_bucket_name = "aws-us-east-2-dev-beanstalk-source-bucket"
beanstalk_app_version_source_bucket_key_name = "dotnet-blue.zip"

#BEANSTALK CONFIG TEMPLATE (ENVIRONMENT)

solution_stack_name = "64bit Windows Server Core 2019 v2.5.2 running IIS 10.0"
aws_terraform_demo_ec2_keypair_name = "aws-us-east-2-dev-terraform-demo-keypair"
instance_type = "m4.large"
beanstalk_config_template_name = "beanstalk_config_template_dev"
beanstalk_environment_name = "terraform-demo-dev"