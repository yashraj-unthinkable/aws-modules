## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_iam_instance_profile.iam_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Friendly name of the role

Type: `string`

### <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn)

Description: ROLE ARN

Type: `string`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Key-value mapping of tags for the IAM role

Type: `map(string)`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_profile_arn"></a> [profile\_arn](#output\_profile\_arn)

Description: Amazon Resource Name (ARN) specifying the instance\_profile

### <a name="output_profile_name"></a> [profile\_name](#output\_profile\_name)

Description: Profile Name specifying the instance\_profile
