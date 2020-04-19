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

variable "environment" {}

locals {
  secrethub_dir = "your-org/your-repo/${var.environment}"
}

resource "secrethub_secret" "db_password" {
  path = "${local.secrethub_dir}/db/password"

  generate {
    length      = 22
    use_symbols = true
  }
}

resource "secrethub_secret" "db_user" {
  path  = "${local.secrethub_dir}/db/user"
  value = "mysqluser"
}

data "secrethub_secret" "stripe_secret_key" {
  path = "stripe/secret_key"
}

resource "heroku_app" "your_app" {
  name   = "your-app"
  region = "us"

  sensitive_config_vars = {
    DB_PASSWORD       = secrethub_secret.db_password.value
    DB_USER           = secrethub_secret.db_user.value
    STRIPE_SECRET_KEY = data.secrethub_secret.stripe_secret_key.value
  }
}