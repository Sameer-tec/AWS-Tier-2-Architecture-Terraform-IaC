resource "random_password" "db_random_password" {
    length  = 16
    special = true
    override_special = "_%#^&*"

}


resource "random_id" "suffix" {
    byte_length = 4
  
}


resource "aws_secretsmanager_secret" "db_password" {
    name        = "${var.db_name}-${var.db_username}-db-password-${random_id.suffix.hex}"
    description = "Database password for ${var.project_name}"

    tags = {
        Name        = "${var.project_name}-db-password"
        Environment = "dev"
    }
}


resource "aws_secretsmanager_secret_version" "db_password_version" {
    secret_id = aws_secretsmanager_secret.db_password.id
    secret_string = jsonencode({
        username = var.db_username
        password = random_password.db_random_password.result
        engine   = "mysql"
        host     = "" # This can be populated by the application or looked up later
    })
}