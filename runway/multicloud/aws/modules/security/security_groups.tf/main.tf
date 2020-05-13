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

#RESOURCES
resource "aws_security_group" "elb" {
  name        = "elb-sg-${var.region}-${var.environment}"
  description = "Allow 80 and 443 ingress on the load balancer"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "HTTPS from world"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  ingress {
    description = "HTTP from world"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "elb-sg-${var.region}-${var.environment}"
  }
}

resource "aws_security_group" "ec2" {
  name        = "ec2-sg-${var.region}-${var.environment}"
  description = "Allow 80 and 443 ingress from the load balancer to the backend ec2 instances"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "HTTPS from the load balancer"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.elb.id]
  }

  
  ingress {
    description = "HTTP from the load balancer"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.elb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-sg-${var.region}-${var.environment}"
  }
}


resource "aws_security_group" "rds" {
  name        = "rds-sg-${var.region}-${var.environment}"
  description = "Allow 3306 ingress from the backend ec2 instances to the RDS database"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "HTTPS from the load balancer"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg-${var.region}-${var.environment}"
  }
}


resource "aws_security_group" "redis" {
  name        = "redis-sg-${var.region}-${var.environment}"
  description = "Allow 3306 ingress from the backend ec2 instances to the RDS database"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "HTTPS from the load balancer"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg-${var.region}-${var.environment}"
  }
}



resource "aws_security_group" "jenkins" {
  name        = "jenkins-sg-${var.region}-${var.environment}"
  description = "Allow 8080 from specified IP"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "HTTP from specified ip"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["72.44.200.20/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-sg-${var.region}-${var.environment}"
  }
}