output "rds_endpoint" {
  value = aws_db_instance.rds.address
}

output "rds_username" {
  value = aws_db_instance.rds.username
}