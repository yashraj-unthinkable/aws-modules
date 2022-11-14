# ########################################################################################S
# VPC Configurations
# create VPC
resource "aws_vpc" "this" {
  count                = var.create_vpc ? 1 : 0
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = merge(var.tags, { "Name" = var.name })
}

# add more cidr's to vpc
resource "aws_vpc_ipv4_cidr_block_association" "this" {
  count      = var.create_vpc && length(var.secondary_cidr_blocks) > 0 ? length(var.secondary_cidr_blocks) : 0
  vpc_id     = aws_vpc.this[0].id
  cidr_block = element(var.secondary_cidr_blocks, count.index)
}

# ########################################################################################S
# Public Subnet Configurations
# create public subnet
resource "aws_subnet" "public" {
  count                   = var.create_vpc ? length(var.public_subnets) : 0
  vpc_id                  = local.vpc_id
  cidr_block              = element(var.public_subnets, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags                    = merge(var.tags, { "Name" = format("${var.name}-${local.public_subnet_suffix}-%s", element(var.azs, count.index)) })
}

# create internet gateway
resource "aws_internet_gateway" "this" {
  count  = var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0
  vpc_id = local.vpc_id
  tags   = merge({ "Name" = var.name, }, var.tags, )
}

# create route table for public subnets
resource "aws_route_table" "public" {
  count  = var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0
  vpc_id = local.vpc_id
  tags   = merge({ "Name" = "${var.name}-${local.public_subnet_suffix}" }, var.tags)
}

# create route for public route table
resource "aws_route" "public_internet_gateway" {
  count                  = var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0
  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[0].id
  timeouts { create = "5m" }
}

# associate route table to public subnets
resource "aws_route_table_association" "public" {
  count          = var.create_vpc && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public[0].id
}

# ########################################################################################S
# Private Subnet Configurations
# create private subnet
resource "aws_subnet" "private" {
  count                   = var.create_vpc ? length(var.private_subnets) : 0
  vpc_id                  = local.vpc_id
  cidr_block              = element(var.private_subnets, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = false
  tags                    = merge(var.tags, { "Name" = format("${var.name}-${local.private_subnet_suffix}-%s", element(var.azs, count.index), ) })
}

# create route table for private subnets
resource "aws_route_table" "private" {
  count  = var.create_vpc && local.max_subnet_length > 0 ? local.nat_gateway_count : 0
  vpc_id = local.vpc_id
  tags   = merge({ "Name" = var.single_nat_gateway ? "${var.name}-${local.private_subnet_suffix}" : format("${var.name}-${local.private_subnet_suffix}-%s", element(var.azs, count.index)) }, var.tags)
}

# associate route table to private subnets
resource "aws_route_table_association" "private" {
  count          = var.create_vpc && length(var.private_subnets) > 0 ? length(var.private_subnets) : 0
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = element(aws_route_table.private[*].id, var.single_nat_gateway ? 0 : count.index)
}

# ########################################################################################S
# Database Subnet Configurations
# create db subnet
resource "aws_subnet" "database" {
  count                   = var.create_vpc ? length(var.database_subnets) : 0
  vpc_id                  = local.vpc_id
  cidr_block              = element(var.database_subnets, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = false
  tags                    = merge(var.tags, { "Name" = format("${var.name}-${local.database_subnet_suffix}-%s", element(var.azs, count.index)) })
}

# create db subnet group
resource "aws_db_subnet_group" "database" {
  count       = var.create_vpc && length(var.database_subnets) > 0 && local.create_database_subnet_group ? 1 : 0
  name        = lower(var.name)
  description = "Database subnet group for ${var.name}"
  subnet_ids  = aws_subnet.database[*].id
  tags        = merge({ "Name" = lower(var.name) }, var.tags)
}

# asociate route table to db subnets
resource "aws_route_table_association" "database" {
  count          = var.create_vpc && length(var.database_subnets) > 0 ? length(var.database_subnets) : 0
  subnet_id      = element(aws_subnet.database[*].id, count.index)
  route_table_id = element(aws_route_table.private[*].id, count.index)
}

# ########################################################################################S
# NAT GATEWAY Configurations
resource "aws_nat_gateway" "this" {
  count         = var.create_vpc && var.enable_nat_gateway ? local.nat_gateway_count : 0
  allocation_id = element(local.nat_gateway_ip_id, var.single_nat_gateway ? 0 : count.index)
  subnet_id     = element(aws_subnet.public[*].id, var.single_nat_gateway ? 0 : count.index)
  tags          = merge({ "Name" = format("${var.name}-%s", element(var.azs, var.single_nat_gateway ? 0 : count.index), ) }, var.tags)
  depends_on    = [aws_internet_gateway.this]
}

# create nat elastic ip's using EIP module
module "nat_eip" {
  source = "../eip"
  count  = var.create_vpc && var.enable_nat_gateway && false == var.reuse_nat_ips ? local.nat_gateway_count : 0
  tags   = merge({ "Name" = format("${var.name}-%s", element(var.azs, var.single_nat_gateway ? 0 : count.index), ) }, var.tags)
}

# associate nat gateway to route table
resource "aws_route" "private_nat_gateway" {
  count                  = var.create_vpc && var.enable_nat_gateway ? local.nat_gateway_count : 0
  route_table_id         = element(aws_route_table.private[*].id, count.index)
  destination_cidr_block = local.nat_gateway_destination_cidr_block
  nat_gateway_id         = element(aws_nat_gateway.this[*].id, count.index)
  timeouts { create = "5m" }
}

# ########################################################################################S
# Flow Logs Configurations
resource "aws_flow_log" "this" {
  count                    = var.create_vpc && var.enable_flow_log ? 1 : 0
  log_destination_type     = var.flow_log_destination_type
  log_destination          = local.flow_log_destination_arn
  iam_role_arn             = local.flow_log_iam_role_arn
  traffic_type             = local.flow_log_traffic_type
  vpc_id                   = local.vpc_id
  max_aggregation_interval = local.flow_log_max_aggregation_interval
  tags                     = var.tags
}

# create cloudwatch log group
resource "aws_cloudwatch_log_group" "flow_log" {
  count             = var.create_vpc && local.create_flow_log_cloudwatch_log_group ? 1 : 0
  name              = local.aws_cloudwatch_log_group_name
  retention_in_days = var.flow_log_cloudwatch_log_group_retention_in_days
  tags              = var.tags
}

# create iam role using iam_role module
module "iam_role" {
  source             = "https://github.com/yashrajdighe/aws-modules/tree/main/iam/iam_role"
  count              = var.create_vpc && local.create_flow_log_cloudwatch_iam_role ? 1 : 0
  name               = local.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.flow_log_cloudwatch_assume_role[0].json
  tags               = var.tags
}

# create iam policy using iam_policy module
module "iam_policy" {
  source      = "https://github.com/yashrajdighe/aws-modules/tree/main/iam/iam_policy"
  count       = var.create_vpc && local.create_flow_log_cloudwatch_iam_role ? 1 : 0
  name        = local.iam_policy_name
  description = local.iam_policy_description
  policy      = data.aws_iam_policy_document.vpc_flow_log_cloudwatch[0].json
  tags        = var.tags
}

# create s3 bucket for vpc_flow_logs
module "s3" {
  source      = "https://github.com/yashrajdighe/aws-modules/tree/main/s3"
  count       = var.create_flow_log_destination_s3 ? 1 : 0
  bucket_name = local.create_flow_log_s3_name
  tags        = var.tags
}
