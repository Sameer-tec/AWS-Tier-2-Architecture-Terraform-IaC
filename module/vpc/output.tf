
output "vpc_id" {
    value = aws_vpc.my_vpc.id
    description = "ID of the VPC"
  
}


output "my_public_subnet_id" {
    value = aws_subnet.my_public_subnet.id
    description = "ID of the public subnet"
  
}





output "private_subnet_ids" {
    value = [aws_subnet.my_private_subnet1.id, aws_subnet.my_private_subnet2.id]
    description = "IDs of the private subnets"

  
}



output "my_internet_gateway_id" {
    value = aws_internet_gateway.my_igw.id
    description = "ID of the Internet Gateway"
}

output "my_public_route_table_id" {
    value = aws_route_table.my_public_rt.id
    description = "ID of the public route table"
  
}