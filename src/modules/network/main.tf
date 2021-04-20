resource "aws_vpc" "vpc_main" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true

    tags = {
      "Name" = var.tags
    }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = var.subnet1_cidr
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "private subnet 1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = var.subnet2_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "private subnet 2"
  }
}