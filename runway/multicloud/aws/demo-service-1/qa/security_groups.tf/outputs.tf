output "elb_sg_id" {
  value = module.security_groups.elb_sg_id
}

output "ec2_sg_id" {
  value = module.security_groups.ec2_sg_id
}

output "rds_sg_id" {
  value = module.security_groups.rds_sg_id
}