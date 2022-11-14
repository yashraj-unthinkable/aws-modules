## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (4.34.0)

## Modules

The following Modules are called:

### <a name="module_iam_policy"></a> [iam\_policy](#module\_iam\_policy)

Source: ../iam/iam_policy

Version:

### <a name="module_iam_role"></a> [iam\_role](#module\_iam\_role)

Source: ../iam/iam_role

Version:

### <a name="module_nat_eip"></a> [nat\_eip](#module\_nat\_eip)

Source: ../eip

Version:

### <a name="module_s3"></a> [s3](#module\_s3)

Source: ../s3

Version:

## Resources

The following resources are used by this module:

- [aws_cloudwatch_log_group.flow_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) (resource)
- [aws_db_subnet_group.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) (resource)
- [aws_flow_log.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) (resource)
- [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) (resource)
- [aws_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) (resource)
- [aws_route.private_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) (resource)
- [aws_route.public_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) (resource)
- [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) (resource)
- [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) (resource)
- [aws_route_table_association.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) (resource)
- [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) (resource)
- [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) (resource)
- [aws_subnet.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) (resource)
- [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) (resource)
- [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) (resource)
- [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) (resource)
- [aws_vpc_ipv4_cidr_block_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_ipv4_cidr_block_association) (resource)
- [aws_iam_policy_document.flow_log_cloudwatch_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_azs"></a> [azs](#input\_azs)

Description: A list of availability zones names or ids in the region

Type: `list(string)`

### <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block)

Description: The IPv4 CIDR block for the VPC

Type: `string`

### <a name="input_database_subnets"></a> [database\_subnets](#input\_database\_subnets)

Description: A list of database subnets inside the VPC. Minimum 2 subnets required for DB Subnet Group

Type: `list(string)`

### <a name="input_name"></a> [name](#input\_name)

Description: Name of VPC to be created

Type: `string`

### <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets)

Description: A list of private subnets inside the VPC

Type: `list(string)`

### <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets)

Description: A list of public subnets inside the VPC

Type: `list(string)`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_create_flow_log_destination_s3"></a> [create\_flow\_log\_destination\_s3](#input\_create\_flow\_log\_destination\_s3)

Description: Create S3 for flow logs

Type: `bool`

Default: `false`

### <a name="input_create_vpc"></a> [create\_vpc](#input\_create\_vpc)

Description: create VPC

Type: `bool`

Default: `true`

### <a name="input_enable_flow_log"></a> [enable\_flow\_log](#input\_enable\_flow\_log)

Description: Whether or not to enable VPC Flow Logs

Type: `bool`

Default: `false`

### <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway)

Description: Should be true if you want to provision NAT Gateways for each of your private networks

Type: `bool`

Default: `false`

### <a name="input_external_nat_ip_ids"></a> [external\_nat\_ip\_ids](#input\_external\_nat\_ip\_ids)

Description: List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse\_nat\_ips)

Type: `list(string)`

Default: `[]`

### <a name="input_external_nat_ips"></a> [external\_nat\_ips](#input\_external\_nat\_ips)

Description: List of EIPs to be used for `nat_public_ips` output (used in combination with reuse\_nat\_ips and external\_nat\_ip\_ids)

Type: `list(string)`

Default: `[]`

### <a name="input_flow_log_cloudwatch_log_group_name_prefix"></a> [flow\_log\_cloudwatch\_log\_group\_name\_prefix](#input\_flow\_log\_cloudwatch\_log\_group\_name\_prefix)

Description: Specifies the name prefix of CloudWatch Log Group for VPC flow logs. Required if flow\_log\_destination\_type is cloud-watch-logs

Type: `string`

Default: `""`

### <a name="input_flow_log_cloudwatch_log_group_retention_in_days"></a> [flow\_log\_cloudwatch\_log\_group\_retention\_in\_days](#input\_flow\_log\_cloudwatch\_log\_group\_retention\_in\_days)

Description: Specifies the number of days you want to retain log events in the specified log group for VPC flow logs. Required if flow\_log\_destination\_type is cloud-watch-logs

Type: `number`

Default: `30`

### <a name="input_flow_log_destination_arn_s3"></a> [flow\_log\_destination\_arn\_s3](#input\_flow\_log\_destination\_arn\_s3)

Description: ARN of s3 bucket. Required if create\_flow\_log\_destination\_s3 is false

Type: `string`

Default: `""`

### <a name="input_flow_log_destination_type"></a> [flow\_log\_destination\_type](#input\_flow\_log\_destination\_type)

Description: Type of flow log destination. Can be s3 or cloud-watch-logs. Required if enable\_flow\_logs is true

Type: `string`

Default: `""`

### <a name="input_flow_log_s3_name_prefix"></a> [flow\_log\_s3\_name\_prefix](#input\_flow\_log\_s3\_name\_prefix)

Description: Specifies the name prefix of S3 for VPC flow logs. Required if create\_flow\_log\_destination\_s3 is false

Type: `string`

Default: `""`

### <a name="input_one_nat_gateway_per_az"></a> [one\_nat\_gateway\_per\_az](#input\_one\_nat\_gateway\_per\_az)

Description: Should be true if you want only one NAT Gateway per availability zone

Type: `bool`

Default: `false`

### <a name="input_reuse_nat_ips"></a> [reuse\_nat\_ips](#input\_reuse\_nat\_ips)

Description: Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external\_nat\_ip\_ids' variable

Type: `bool`

Default: `false`

### <a name="input_secondary_cidr_blocks"></a> [secondary\_cidr\_blocks](#input\_secondary\_cidr\_blocks)

Description: List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool

Type: `list(string)`

Default: `[]`

### <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway)

Description: Should be true if you want to provision a single shared NAT Gateway across all of your private networks

Type: `bool`

Default: `false`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to add to all resources related to VPC

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_database_subnet_arns"></a> [database\_subnet\_arns](#output\_database\_subnet\_arns)

Description: List of ARNs of database subnets

### <a name="output_database_subnet_group"></a> [database\_subnet\_group](#output\_database\_subnet\_group)

Description: ID of database subnet group

### <a name="output_database_subnet_group_name"></a> [database\_subnet\_group\_name](#output\_database\_subnet\_group\_name)

Description: Name of database subnet group

### <a name="output_database_subnets"></a> [database\_subnets](#output\_database\_subnets)

Description: List of IDs of database subnets

### <a name="output_igw_arn"></a> [igw\_arn](#output\_igw\_arn)

Description: The ARN of the Internet Gateway

### <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id)

Description: The ID of the Internet Gateway

### <a name="output_nat_ids"></a> [nat\_ids](#output\_nat\_ids)

Description: List of allocation ID of Elastic IPs created for AWS NAT Gateway

### <a name="output_nat_public_ips"></a> [nat\_public\_ips](#output\_nat\_public\_ips)

Description: List of public Elastic IPs created for AWS NAT Gateway

### <a name="output_natgw_ids"></a> [natgw\_ids](#output\_natgw\_ids)

Description: List of NAT Gateway IDs

### <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns)

Description: List of ARNs of private subnets

### <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets)

Description: List of IDs of private subnets

### <a name="output_public_subnet_arns"></a> [public\_subnet\_arns](#output\_public\_subnet\_arns)

Description: List of ARNs of public subnets

### <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets)

Description: List of IDs of public subnets

### <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn)

Description: The ARN of the VPC

### <a name="output_vpc_flow_log_cloudwatch_iam_role_arn"></a> [vpc\_flow\_log\_cloudwatch\_iam\_role\_arn](#output\_vpc\_flow\_log\_cloudwatch\_iam\_role\_arn)

Description: The ARN of the IAM role used when pushing logs to Cloudwatch log group

### <a name="output_vpc_flow_log_id"></a> [vpc\_flow\_log\_id](#output\_vpc\_flow\_log\_id)

Description: The ID of the Flow Log resource

### <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id)

Description: The ID of the VPC

### <a name="output_vpc_owner_id"></a> [vpc\_owner\_id](#output\_vpc\_owner\_id)

Description: The ID of the AWS account that owns the VPC
