output "db_password" {
    description = "The database password stored in Secrets Manager"
    value = random_password.db_random_password.result
  
}

output "secret_arn" {
    description = "ARN of the secret in Secrets Manager"
    value = aws_secretsmanager_secret.db_password.arn
  
}