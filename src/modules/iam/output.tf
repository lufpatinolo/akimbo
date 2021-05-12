output "ec2_ssm_profile_name" {
  description = "Instance profile name SSM"
  value       = aws_iam_instance_profile.ec2_ssm_profile.name
}