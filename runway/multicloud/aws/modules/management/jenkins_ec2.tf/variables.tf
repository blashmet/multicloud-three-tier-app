variable "region" {
  description = "The region to deploy to."
  type        = string
}

variable "keypair_name" {
  description = "The keypair name"
  type        = string
}

variable "tf_state_vpc_bucket_name" {
  description = "TF state bucket"
  type        = string
}

variable "tf_state_vpc_key_name" {
  description = "The state file S3 key."
  type        = string
}

variable "tf_state_security_groups_bucket_name" {
  description = "TF state bucket"
  type        = string
}

variable "tf_state_security_groups_key_name" {
  description = "The state file S3 key."
  type        = string
}