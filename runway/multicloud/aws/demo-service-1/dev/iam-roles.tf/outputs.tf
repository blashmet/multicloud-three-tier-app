output "beanstalk_role_id" {
  value = module.iam_roles.beanstalk_role_id
}

output "ec2_role_id" {
  value = module.iam_roles.ec2_role_id
}