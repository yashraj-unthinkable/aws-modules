output "policy_arn" {
  value       = aws_iam_policy.policy.arn
  description = "Policy ARN"
}

output "policy_name" {
  value       = aws_iam_policy.policy.name
  description = "Policy Name"
}
