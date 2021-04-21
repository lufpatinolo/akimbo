resource "aws_vpc" "vpc_main" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true

    tags = {
      "Name" = var.tags
    }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "private subnet 1"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "public subnet 1"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_main.id

  tags = {
    "Name" = "Internet Gateway main"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_table_1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_eip" "eip" {
  vpc = true

  tags = {
    "Name" = "Elastic IP for NAT gw"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet1.id  

  tags = {
    "Name" = "Nat Gateway"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    "Name" = "Private Route Table"
  }
}

resource "aws_route_table_association" "private_table_1" {
  subnet_id = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_rt.id
}