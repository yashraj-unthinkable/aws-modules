locals {
  # vpc locals
  vpc_id                             = aws_vpc.this[0].id # Use `local.vpc_id` to give a hint to Terraform that subnets should be deleted before secondary CIDR blocks can be free!
  public_subnet_suffix               = "public"
  private_subnet_suffix              = "private"
  database_subnet_suffix             = "database"
  create_database_subnet_group       = true
  max_subnet_length                  = max(length(var.private_subnets), length(var.database_subnets))
  nat_gateway_count                  = var.single_nat_gateway ? 1 : var.one_nat_gateway_per_az ? length(var.azs) : length(var.private_subnets)
  nat_gateway_ip_id                  = var.reuse_nat_ips ? var.external_nat_ip_ids : try(tolist(flatten(module.nat_eip[*].eip_id)), [])
  nat_gateway_destination_cidr_block = "0.0.0.0/0"

  # flow logs locals
  create_flow_log_cloudwatch_log_group = var.enable_flow_log && var.flow_log_destination_type == "cloud-watch-logs" ? true : false
  create_flow_log_cloudwatch_iam_role  = var.enable_flow_log && var.flow_log_destination_type == "cloud-watch-logs" ? true : false
  flow_log_traffic_type                = "ALL" # can be ACCEPT, REJECT or ALL
  flow_log_max_aggregation_interval    = 600
  flow_log_iam_role_arn                = var.enable_flow_log && var.flow_log_destination_type == "cloud-watch-logs" ? module.iam_role[0].role_arn : null
  flow_log_destination_arn             = var.enable_flow_log && var.flow_log_destination_type == "cloud-watch-logs" ? aws_cloudwatch_log_group.flow_log[0].arn : var.create_flow_log_destination_s3 ? module.s3[0].arn : var.flow_log_destination_arn_s3
  aws_cloudwatch_log_group_name        = "${var.flow_log_cloudwatch_log_group_name_prefix}-${local.vpc_id}"
  iam_role_name                        = "vpc-flow-log-role"
  iam_policy_name                      = "vpc-flow-log-to-cloudwatch"
  iam_policy_description               = "Iam policy for role to store vpc flow logs to cloudwatch logs"
  create_flow_log_s3_name              = var.enable_flow_log && var.flow_log_destination_type == "s3" ? "${var.flow_log_s3_name_prefix}-${local.vpc_id}" : null
}
