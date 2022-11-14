output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(aws_vpc.this[0].id, "")
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = try(aws_vpc.this[0].arn, "")
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = try(aws_vpc.this[0].owner_id, "")
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = aws_subnet.private[*].arn
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = aws_subnet.public[*].arn
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = aws_subnet.database[*].id
}

output "database_subnet_arns" {
  description = "List of ARNs of database subnets"
  value       = aws_subnet.database[*].arn
}

output "database_subnet_group" {
  description = "ID of database subnet group"
  value       = try(aws_db_subnet_group.database[0].id, "")
}

output "database_subnet_group_name" {
  description = "Name of database subnet group"
  value       = try(aws_db_subnet_group.database[0].name, "")
}

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = module.nat_eip[*].eip_id
}

output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = var.reuse_nat_ips ? var.external_nat_ips : try(tolist(flatten(module.nat_eip[*].public_ip)), [])
}

output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = aws_nat_gateway.this[*].id
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = try(aws_internet_gateway.this[0].id, "")
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = try(aws_internet_gateway.this[0].arn, "")
}

output "vpc_flow_log_id" {
  description = "The ID of the Flow Log resource"
  value       = try(aws_flow_log.this[0].id, "")
}

output "vpc_flow_log_cloudwatch_iam_role_arn" {
  description = "The ARN of the IAM role used when pushing logs to Cloudwatch log group"
  value       = local.flow_log_iam_role_arn
}
