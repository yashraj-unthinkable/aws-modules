## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_description"></a> [description](#input\_description)

Description: The description of the policy

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the policy

Type: `string`

### <a name="input_policy"></a> [policy](#input\_policy)

Description: Policy

Type: `string`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Tags

Type: `map(string)`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn)

Description: Policy ARN

### <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name)

Description: Policy Name
