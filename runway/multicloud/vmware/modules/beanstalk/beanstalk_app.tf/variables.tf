variable "region" {
  description = "The region to deploy to."
  type        = string
}

variable "environment" {
  description = "The environment name."
  type        = string
}

variable "application_name" {
  description = "The app name."
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