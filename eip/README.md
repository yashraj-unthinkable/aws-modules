## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) (resource)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to add to all resources related to EIP

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_eip_id"></a> [eip\_id](#output\_eip\_id)

Description: ID of Elastic IP

### <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns)

Description: Public DNS of Elastic IP

### <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip)

Description: Public IP of Elastic IP
