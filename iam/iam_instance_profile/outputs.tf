output "profile_arn" {
  value       = aws_iam_instance_profile.iam_instance_profile.arn
  description = "Amazon Resource Name (ARN) specifying the instance_profile"
}

output "profile_name" {
  value       = aws_iam_instance_profile.iam_instance_profile.name
  description = "Profile Name specifying the instance_profile"
}
