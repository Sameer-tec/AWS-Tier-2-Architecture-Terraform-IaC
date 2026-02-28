output "web_sg_id" {
    description = "ID of the web server security group"
    value       = aws_security_group.web_sg.id
  
}


output "db_sg_id" {
    description = "ID of the database security group"
    value       = aws_security_group.db_sg.id
}