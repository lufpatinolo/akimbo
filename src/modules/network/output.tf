output "vpc_id" {
  description = "Id of the VPC"
  value       = aws_vpc.vpc_main.id 
}

output "private_subnet1_id" {
  description = "Id of private subnet 1"
  value       = aws_subnet.private_subnet1.id
}