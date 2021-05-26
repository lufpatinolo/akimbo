output "ec2_ssm_profile_name" {
  description = "Instance profile name SSM"
  value       = aws_iam_instance_profile.ec2_ssm_profile.name
}

output "ecs_task_role" {
  value = aws_iam_role.ecs_task_role.arn
}

output "ecs_task_execution_role" {
  value = aws_iam_role.ecs_task_execution_role.arn
}