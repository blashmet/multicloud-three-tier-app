variable "region" {
  description = "The region to deploy to."
  type        = string
}

variable "environment" {
  description = "The environment name: dev, qa, or prod."
  type        = string
}

variable "tf_state_vpc_bucket_name" {
  description = "State bucket."
  type        = string
}

variable "tf_state_vpc_key_name" {
  description = "State key."
  type        = string
}

variable "tf_state_secrets_bucket_name" {
  description = "The region to deploy to."
  type        = string
}

variable "tf_state_secrets_key_name" {
  description = "State key"
  type        = string
}

variable "tf_state_security_groups_bucket_name" {
  description = "State bucket"
  type        = string
}

variable "tf_state_security_groups_key_name" {
  description = "State key"
  type        = string
}

variable "username" {
  description = "State bucket."
  type        = string
}

variable "password" {
  description = "State key."
  type        = string
}

variable "allocated_storage" {
  description = "The region to deploy to."
  type        = string
}

variable "storage_type" {
  description = "State key"
  type        = string
}

variable "engine" {
  description = "State key."
  type        = string
}

variable "engine_version" {
  description = "The region to deploy to."
  type        = string
}

variable "instance_class" {
  description = "State key"
  type        = string
}



variable "name" {
  description = "State key"
  type        = string
}

variable "parameter_group_name" {
  description = "State key."
  type        = string
}

variable "subnet_group_name" {
  description = "The region to deploy to."
  type        = string
}

variable "db_instance_identifier" {
  description = "State key"
  type        = string
}