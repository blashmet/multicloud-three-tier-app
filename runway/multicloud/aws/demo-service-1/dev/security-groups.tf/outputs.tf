output "elb_sg_id" {
  value = module.security-groups.elb_sg_id
}

output "ec2_sg_id" {
  value = module.security-groups.ec2_sg_id
}

output "rds_sg_id" {
  value = module.security-groups.rds_sg_id
}