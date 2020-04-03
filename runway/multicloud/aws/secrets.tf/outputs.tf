output "rds_secret_id" {
  value = aws_secretsmanager_secret.rds-secret.id
}

output "rds_secret_arn" {
  value = aws_secretsmanager_secret.rds-secret.arn
}