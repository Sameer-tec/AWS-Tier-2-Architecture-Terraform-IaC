variable "instance_type" {
    description = "The type of EC2 instance to create"
    type        = string
    default     = "t3.micro"  
}

variable "project_name" {
    description = "The name of the project"
    type        = string
    default     = "day22-project"
  
}

variable "aws_region" {
    description = "AWS region to deploy resources"
    type        = string
    default     = "ap-south-1"
  
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR block for public subnet"
    type        = string
    default     = "10.0.1.0/24"
}


variable "private_subnet_cidrs" {
    description = "CIDR for private subnet"
    type        = list(string)
    default     = ["10.0.2.0/24", "10.0.3.0/24"]
  
}





variable "db_name" {
    description = "Name of the database"
    type        = string
    default     = "my_web_db_proj"
  
}

variable "db_username" {
    description = "Database master username"
    type        = string
    default     = "admin"
    sensitive   = true
  
}


variable "db_instance_class" {
    description = "RDS instance class"
    type        = string
    default     = "db.t3.micro"
  
}


variable "db_allocated_storage" {
    description = "Maximum allocated storage for RDS instance (in GB)"
    type        = number
    default     = 20
  
}


variable "db_engine_version" {
    description = "RDS engine version"
    type        = string
    default     = "8.0"
  
}


