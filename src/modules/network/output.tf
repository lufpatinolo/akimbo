output "vpc_id" {
  description = "Id of the VPC"
  value       = aws_vpc.vpc_main.id 
}