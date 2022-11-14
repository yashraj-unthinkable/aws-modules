variable "create_vpc" {
  type        = bool
  default     = true
  description = "create VPC"
}

variable "name" {
  type        = string
  description = "Name of VPC to be created"
}

variable "cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for the VPC"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to all resources related to VPC"
}

variable "secondary_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool"
}

variable "azs" {
  type        = list(string)
  description = "A list of availability zones names or ids in the region"
}

variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnets inside the VPC"
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of private subnets inside the VPC"
}

variable "database_subnets" {
  type        = list(string)
  description = "A list of database subnets inside the VPC. Minimum 2 subnets required for DB Subnet Group"
}

variable "single_nat_gateway" {
  type        = bool
  default     = false
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
}

variable "one_nat_gateway_per_az" {
  type        = bool
  default     = false
  description = "Should be true if you want only one NAT Gateway per availability zone"
}

variable "enable_nat_gateway" {
  type        = bool
  default     = false
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
}

variable "reuse_nat_ips" {
  type        = bool
  default     = false
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
}

variable "external_nat_ip_ids" {
  type        = list(string)
  default     = []
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
}

variable "external_nat_ips" {
  type        = list(string)
  default     = []
  description = "List of EIPs to be used for `nat_public_ips` output (used in combination with reuse_nat_ips and external_nat_ip_ids) "
}

variable "enable_flow_log" {
  default     = false
  type        = bool
  description = "Whether or not to enable VPC Flow Logs"
}

variable "flow_log_destination_type" {
  type        = string
  default     = ""
  description = "Type of flow log destination. Can be s3 or cloud-watch-logs. Required if enable_flow_logs is true"
}

variable "flow_log_cloudwatch_log_group_name_prefix" {
  type        = string
  default     = ""
  description = "Specifies the name prefix of CloudWatch Log Group for VPC flow logs. Required if flow_log_destination_type is cloud-watch-logs"
}

variable "flow_log_cloudwatch_log_group_retention_in_days" {
  type        = number
  default     = 30
  description = "Specifies the number of days you want to retain log events in the specified log group for VPC flow logs. Required if flow_log_destination_type is cloud-watch-logs"
}

variable "create_flow_log_destination_s3" {
  type        = bool
  default     = false
  description = "Create S3 for flow logs"
}

variable "flow_log_destination_arn_s3" {
  description = "ARN of s3 bucket. Required if create_flow_log_destination_s3 is false"
  type        = string
  default     = ""
}

variable "flow_log_s3_name_prefix" {
  type        = string
  default     = ""
  description = "Specifies the name prefix of S3 for VPC flow logs. Required if create_flow_log_destination_s3 is false"
}
