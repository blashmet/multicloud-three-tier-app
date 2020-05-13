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
    redis_sg_id = ""
    jenkins_sg_id = ""
    
  }
}




#RESOURCES
resource "aws_elasticache_subnet_group" "redis_subnet_group" {

  
  name = "redis-subnet-group-${var.region}-${var.environment}"
  
  subnet_ids = [    
                data.terraform_remote_state.vpc.outputs.pri_sub_1_id,
                data.terraform_remote_state.vpc.outputs.pri_sub_2_id
               ]

}



resource "aws_elasticache_cluster" "redis_cluster" {

  cluster_id           = "kd-redis-cluster"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  security_group_ids    = [data.terraform_remote_state.security_groups.outputs.redis_sg_id]
  subnet_group_name      = aws_elasticache_subnet_group.redis_subnet_group.id

  depends_on = [

    aws_elasticache_subnet_group.redis_subnet_group,

  ]

}