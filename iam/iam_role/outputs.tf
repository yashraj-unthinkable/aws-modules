output "role_arn" {
  value       = aws_iam_role.iam_role.arn
  description = "Amazon Resource Name (ARN) specifying the role"
}

output "role_name" {
  value       = aws_iam_role.iam_role.name
  description = "Role Name"
}
