output "bastion_sg1_id" {
  description = "Id of public subnet 2"
  value       = aws_security_group.bastion-sg-1.id
}