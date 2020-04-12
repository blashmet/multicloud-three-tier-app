#REMOTE STATE
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.tf_state_vpc_bucket_name
    key = var.tf_state_vpc_key_name
    region = var.region
  }
}

data "terraform_remote_state" "gateways" {
  backend = "s3"
  config = {
    bucket = var.tf_state_gateways_bucket_name
    key = var.tf_state_gateways_key_name
    region = var.region
  }
}

#RESOURCES
resource "aws_route_table" "public_route_table_1" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.terraform_remote_state.gateways.outputs.igw_id
  }

  tags = {
    Name = "public-route-table-1-${var.region}-${var.environment}"
  }
}

resource "aws_route_table" "public_route_table_2" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.terraform_remote_state.gateways.outputs.igw_id
  }

  tags = {
    Name = "public-route-table-2-${var.region}-${var.environment}"
  }
}

resource "aws_route_table" "private_route_table_1" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.terraform_remote_state.gateways.outputs.ngw_id
  }

  tags = {
    Name = "private-route-table-1-${var.region}-${var.environment}"
  }
}

resource "aws_route_table" "private_route_table_2" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.terraform_remote_state.gateways.outputs.ngw_id
  }

  tags = {
    Name = "private-route-table-2-${var.region}-${var.environment}"
  }
}


resource "aws_route_table_association" "public_route_table_association_1" {
  subnet_id      = data.terraform_remote_state.vpc.outputs.pub_sub_1_id
  route_table_id = aws_route_table.public_route_table_1.id
}

resource "aws_route_table_association" "public_route_table_association_2" {
  subnet_id      = data.terraform_remote_state.vpc.outputs.pub_sub_2_id
  route_table_id = aws_route_table.public_route_table_2.id
}

resource "aws_route_table_association" "private_route_table_association_1" {
  subnet_id      = data.terraform_remote_state.vpc.outputs.pri_sub_1_id
  route_table_id = aws_route_table.private_route_table_1.id
}

resource "aws_route_table_association" "private_route_table_association_2" {
  subnet_id      = data.terraform_remote_state.vpc.outputs.pri_sub_2_id
  route_table_id = aws_route_table.private_route_table_2.id
}