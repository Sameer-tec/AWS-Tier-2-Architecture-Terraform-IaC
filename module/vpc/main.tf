resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
  
}


resource "aws_subnet" "my_public_subnet" {
    vpc_id     = aws_vpc.my_vpc.id
    cidr_block = var.public_subnet_cidr
    map_public_ip_on_launch = true
    availability_zone = "${var.aws_region}a"
  
}

resource "aws_subnet" "my_private_subnet1" {

    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.private_subnet_cidrs[0]
    availability_zone = "${var.aws_region}a"

}



resource "aws_subnet" "my_private_subnet2" {
    
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.private_subnet_cidrs[1]
    availability_zone = "${var.aws_region}b"
  
}


resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
}


resource "aws_route_table" "my_public_rt" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }

  
}


resource "aws_route_table_association" "my_public_rt_assoc" {
    subnet_id = aws_subnet.my_public_subnet.id
    route_table_id = aws_route_table.my_public_rt.id
  
}

