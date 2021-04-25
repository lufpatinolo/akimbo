output "bastion_sg1_id" {
  description = "Id sg"
  value       = aws_security_group.bastion_sg_1.id
}

output "app_load_sg" {
  description = "Id sg"
  value       = aws_security_group.app_load_sg.id
}

output "ecs_fargate_sg" {
  description = "Id sg"
  value       = aws_security_group.ecs_fargate_sg.id
}