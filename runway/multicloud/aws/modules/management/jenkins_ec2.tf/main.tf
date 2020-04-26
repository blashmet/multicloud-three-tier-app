# REMOTE STATE
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
    jenkins_sg_id = ""
    
  }

}

#RESOURCES

resource "aws_instance" "jenkins_ec2" {

  ami           = "ami-0e48d81a6c2809710"
  instance_type = "m4.large"
  vpc_security_group_ids = [data.terraform_remote_state.security_groups.outputs.jenkins_sg_id]
  subnet_id = data.terraform_remote_state.vpc.outputs.pub_sub_1_id
  key_name = var.keypair_name

  tags = {
    Name = "Jenkins"
  }
}