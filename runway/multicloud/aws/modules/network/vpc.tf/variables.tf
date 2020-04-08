variable "state_key" {
  description = "The region to deploy to."
  type        = string
}

variable "region" {
  description = "The region to deploy to."
  type        = string
}

variable "environment" {
  description = "The environment name: dev, qa, or prod."
  type        = string
}

variable "vpc_cidr" {
  description = "The VPC CIDR block."
  type        = string
}

variable "pub_sub_1_cidr" {
  description = "The CIDR block for public subnet 1."
  type        = string
}

variable "pub_sub_2_cidr" {
  description = "The CIDR block for public subnet 2."
  type        = string
}

variable "pri_sub_1_cidr" {
  description = "The CIDR block for private subnet 1."
  type        = string
}

variable "pri_sub_2_cidr" {
  description = "The CIDR block for private subnet 2."
  type        = string
}

variable "az_1" {
  description = "The CIDR block for public subnet 1."
  type        = string
}

variable "az_2" {
  description = "The CIDR block for public subnet 1."
  type        = string
}