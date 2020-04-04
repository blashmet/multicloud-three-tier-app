output "beanstalk_role_id" {
  value = aws_iam_role.beanstalk_role.id
}

output "ec2_role_id" {
  value = aws_iam_role.ec2_role.id
}
