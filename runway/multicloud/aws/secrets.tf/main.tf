# Variable definitions
variable "region" {}

# Provider and access setup
provider "aws" {
  version = "~> 2.0"
  region = var.region
}

# Backend Config
terraform {
  backend "s3" {
    key = "secrets.tfstate"
  }
}

# Resources

resource "aws_secretsmanager_secret" "rds-secret" {
  name = "rds-secret-${var.region}"
}