region = "us-east-1"
environment = "dev"
rds_secret_stack_name = "aws-us-east-1-rds-secret"

tf_state_vpc_bucket_name = "terraform-state-vpc-bucket"
tf_state_vpc_key_name = "env:/aws/vpc.tfstate"

tf_state_rds_bucket_name = "terraform-state-rds-bucket"
tf_state_rds_key_name = "env:/aws/rds.tfstate"

tf_state_beanstalk_app_bucket_name = "terraform-state-beanstalk-app-bucket"
tf_state_beanstalk_app_key_name = "env:/aws/beanstalk-app.tfstate"

tf_state_iam_roles_bucket_name = "terraform-state-iam-roles-bucket"
tf_state_iam_roles_key_name = "env:/aws/iam-roles.tfstate"

tf_state_security_groups_bucket_name = "terraform-state-security-groups-bucket"
tf_state_security_groups_key_name = "env:/aws/security-groups.tfstate"


#BEANSTALK APPLICATION VERSION
beanstalk_app_version_name = "terraform-demo-us-east-1-dev-config"
beanstalk_app_version_description = "Application version managed by Terraform"
beanstalk_app_version_source_bucket_name = "aws-us-east-1-source-bundle"
beanstalk_app_version_source_bucket_key_name = "dotnet-blue.zip"

#BEANSTALK CONFIG TEMPLATE (ENVIRONMENT)

solution_stack_name = "64bit Windows Server Core 2019 v2.5.2 running IIS 10.0"
terraform_demo_ec2_keypair_name = "terraform-demo-keypair-dev-us-east-1"
instance_type = "m4.large"
beanstalk_config_template_name = "beanstalk_config_template"
beanstalk_env_name = "terraform-demo-dev"