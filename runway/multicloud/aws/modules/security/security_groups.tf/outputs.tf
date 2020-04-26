output "elb_sg_id" {
  value = aws_security_group.elb.id
}

output "ec2_sg_id" {
  value = aws_security_group.ec2.id
}

output "rds_sg_id" {
  value = aws_security_group.rds.id
}

output "jenkins_sg_id" {
  value = aws_security_group.jenkins.id
}