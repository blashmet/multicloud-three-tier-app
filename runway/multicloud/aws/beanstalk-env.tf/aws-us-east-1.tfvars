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



#BEANSTALK ENVIRONMENT
solution_stack_name = "64bit Amazon Linux 2017.03 v2.5.0 running PHP 5.6"
terraform_demo_ec2_keypair_name = "terraform-demo-keypair-dev-us-east-1"
instance_type = "t2.micro"