region = "us-west-1"
environment = "dev"
username             = "REMOTE DATA SOURCE: SEE SECRETS MANAGER"
password             = "REMOTE DATA SOURCE: SEE SECRETS MANAGER"
allocated_storage    = "20"
storage_type         = "gp2"
engine               = "postgres"
engine_version       = "12.2"
instance_class       = "db.m4.large" 
name                 = "awsuswest1postgressqlkillerdemo"
parameter_group_name = "default.mysql5.7"
subnet_group_name    = "aws-us-west-1-dev-db-subnet-group"
db_instance_identifier = "aws-us-west-1-rds-killer-demo-postgres"