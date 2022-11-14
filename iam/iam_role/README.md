## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_iam_role.iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy)

Description: Policy that grants an entity permission to assume the role.

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: Friendly name of the role

Type: `string`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Key-value mapping of tags for the IAM role

Type: `map(string)`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns)

Description: Set of exclusive IAM managed policy ARNs to attach to the IAM role.

Type: `list(any)`

Default: `[]`

### <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration)

Description: Maximum session duration (in seconds) that you want to set for the specified role

Type: `number`

Default: `3600`

## Outputs

The following outputs are exported:

### <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn)

Description: Amazon Resource Name (ARN) specifying the role

### <a name="output_role_name"></a> [role\_name](#output\_role\_name)

Description: Role Name
