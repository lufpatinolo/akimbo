resource "aws_vpc" "vpc_main" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
}

