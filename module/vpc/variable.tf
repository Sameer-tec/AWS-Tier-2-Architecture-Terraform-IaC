variable "vpc_cidr" {
  type = string
  description = "CIDR block for the VPC"
}


variable "public_subnet_cidr" {
    type =string
    description = "Public subnet"
  
}

variable "private_subnet_cidrs" {
    type = list(string)
    description = "Private subnet"
  
}

variable "aws_region" {
  description = "taking value from root module"
  
}