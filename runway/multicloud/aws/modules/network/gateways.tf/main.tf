# BACKEND
terraform {
  backend "s3" {
    key = "gateways.tfstate"
  }
}

# REMOTE STATE
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.tf_state_vpc_bucket_name
    key = var.tf_state_vpc_key_name
    region = var.region
  }
}

# RESOURCES
resource "aws_internet_gateway" "igw" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = {
    Name = "igw-${var.region}-${var.environment}"
  }
}

resource "aws_eip" "ngw_eip" {
  vpc      = true
}

resource "aws_nat_gateway" "ngw" {
  
  allocation_id = aws_eip.ngw_eip.id
  subnet_id     = data.terraform_remote_state.vpc.outputs.pub_sub_1_id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "ngw-${var.region}-${var.environment}"
  }
}