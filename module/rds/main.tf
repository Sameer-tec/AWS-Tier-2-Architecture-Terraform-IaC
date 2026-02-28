resource "aws_db_subnet_group" "db_private_subnet_group" {
    name       = "${var.project_name}-db-subnet-group"
    subnet_ids = var.db_private_subnet_ids
    description = "Database subnet group for ${var.project_name}"
}


resource "aws_db_instance" "main" {
    identifier              = "${var.project_name}-db-instance"
    allocated_storage       = var.db_allocated_storage
    storage_type            = "gp2"
    engine                  = "mysql"
    engine_version          = var.db_engine_version
    instance_class          = var.db_instance_class
    db_name                    = var.db_name
    username                = var.db_username
    password                = var.db_password
    db_subnet_group_name   = aws_db_subnet_group.db_private_subnet_group.name
    vpc_security_group_ids = [var.db_security_group_id]
    skip_final_snapshot     = true
    publicly_accessible = false
    parameter_group_name = "default.mysql8.0"
}