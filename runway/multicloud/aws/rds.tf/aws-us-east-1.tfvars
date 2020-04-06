#NAMESPACE
region = "us-east-1"

#REMOTE STATE
tf_state_vpc_bucket_name = "terraform-state-vpc-bucket"
tf_state_vpc_key_name = "env:/aws/vpc.tfstate"
tf_state_secrets_bucket_name = "terraform-state-secrets-bucket"
tf_state_secrets_key_name = "env:/aws/secrets.tfstate"

#RDS
username             = "REMOTE DATA SOURCE: SEE SECRETS MANAGER"
password             = "REMOTE DATA SOURCE: SEE SECRETS MANAGER"
allocated_storage    = "5"
storage_type         = "standard"
engine               = "mysql"
engine_version       = "5.7.22"
instance_class       = "db.m3.medium" 
name                 = "mydb"
parameter_group_name = "default.mysql5.7"
subnet_group_name    = "rds-subnet-group-us-east-1"
db_instance_identifier = "rds-db-us-east-1"