variable "project_name" {
    description = "The name of the project"
    type        = string
  
}



variable "db_username" {
    description = "Database master username"
    type        = string 
}

variable "db_name" {
    description = "Name of the database"
    type        = string
  
}



variable "db_password" {
    description = "Database master password"
    type        = string  
}



variable "db_instance_class" {
    description = "The instance class for the RDS instance (e.g., db.t3.micro)"
    type        = string 
}

variable "db_allocated_storage" {
    description = "Allocated storage for RDS in GB"
    type        = number 
}

variable "db_engine_version" {
    description = "The version of the database engine"
    type        = string   
}


variable "db_private_subnet_ids" {
    description = "List of private subnet IDs for RDS subnet group"
    type        = list(string)
  
}

variable "db_security_group_id" {
    description = "The ID of the security group to associate with the RDS instance"
    type        = string
  
}