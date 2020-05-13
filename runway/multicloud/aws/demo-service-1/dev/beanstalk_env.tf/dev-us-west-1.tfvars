region = "us-west-1"
environment = "dev"
rds_secret_stack_name = "aws-us-west-1-dev-rds-secret"


#BEANSTALK APPLICATION VERSION
beanstalk_app_version_name = "aws-us-west-1-dev-terraform-demo-config"
beanstalk_app_version_description = "Application version managed by Terraform"
beanstalk_app_version_source_bucket_name = "aws-us-west-1-dev-beanstalk-source-bucket"
beanstalk_app_version_source_bucket_key_name = "killer-demo-custom-beanstalk-deployment.zip"

#BEANSTALK CONFIG TEMPLATE (ENVIRONMENT)

solution_stack_name = "64bit Windows Server 2019 v2.5.5 running IIS 10.0"
aws_terraform_demo_ec2_keypair_name = "aws-us-west-1-dev-service-1-keypair"
instance_type = "m4.large"
beanstalk_config_template_name = "beanstalk_config_template_dev"
beanstalk_environment_name = "terraform-demo-dev"
beanstalk_service_role_name = "us-west-1-dev-beanstalk-service-role"
beanstalk_ec2_instance_profile_name = "us-west-1-dev-beanstalk-ec2-instance-profile"