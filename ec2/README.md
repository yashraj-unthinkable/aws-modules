## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (4.34.0)

## Modules

The following Modules are called:

### <a name="module_eip"></a> [eip](#module\_eip)

Source: ../eip

Version:

## Resources

The following resources are used by this module:

- [aws_eip_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) (resource)
- [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) (resource)
- [aws_ami.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_allow_reassociation"></a> [allow\_reassociation](#input\_allow\_reassociation)

Description: Allow EIP to be reassociated to another Instance or something

Type: `string`

Default: `false`

### <a name="input_ami_name"></a> [ami\_name](#input\_ami\_name)

Description: Name of AMI to use for the instance

Type: `list(string)`

Default: `[]`

### <a name="input_ami_owners"></a> [ami\_owners](#input\_ami\_owners)

Description: AMI owners name

Type: `list(string)`

Default: `[]`

### <a name="input_attach_eip"></a> [attach\_eip](#input\_attach\_eip)

Description: Add EIP to EC2

Type: `string`

Default: `false`

### <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone)

Description: AZ to start the instance in

Type: `string`

Default: `null`

### <a name="input_create"></a> [create](#input\_create)

Description: Whether to create an instance

Type: `bool`

Default: `true`

### <a name="input_disable_api_stop"></a> [disable\_api\_stop](#input\_disable\_api\_stop)

Description: If true, enables EC2 Instance Stop Protection.

Type: `bool`

Default: `null`

### <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination)

Description: If true, enables EC2 Instance Termination Protection

Type: `bool`

Default: `null`

### <a name="input_ebs_block_device"></a> [ebs\_block\_device](#input\_ebs\_block\_device)

Description: Additional EBS block devices to attach to the instance

Type: `list(map(string))`

Default: `[]`

### <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type)

Description: The type of instance to start

Type: `string`

Default: `""`

### <a name="input_key_name"></a> [key\_name](#input\_key\_name)

Description: Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource

Type: `string`

Default: `null`

### <a name="input_monitoring"></a> [monitoring](#input\_monitoring)

Description: If true, the launched EC2 instance will have detailed monitoring enabled

Type: `bool`

Default: `false`

### <a name="input_name"></a> [name](#input\_name)

Description: Name to be used on EC2 instance created

Type: `string`

Default: `""`

### <a name="input_root_block_device"></a> [root\_block\_device](#input\_root\_block\_device)

Description: Customize details about the root block device of the instance. See Block Devices below for details

Type: `list(any)`

Default: `[]`

### <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id)

Description: The VPC Subnet ID to launch in

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A mapping of tags to assign to the resource

Type: `map(string)`

Default: `{}`

### <a name="input_user_data"></a> [user\_data](#input\_user\_data)

Description: The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user\_data\_base64 instead.

Type: `string`

Default: `null`

### <a name="input_volume_tags"></a> [volume\_tags](#input\_volume\_tags)

Description: A mapping of tags to assign to the devices created by the instance at launch time

Type: `map(string)`

Default: `{}`

### <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids)

Description: A list of security group IDs to associate with

Type: `list(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_arn"></a> [arn](#output\_arn)

Description: The ARN of the instance

### <a name="output_elastic_ip"></a> [elastic\_ip](#output\_elastic\_ip)

Description: Elastic IP attached to EC2

### <a name="output_id"></a> [id](#output\_id)

Description: The ID of the instance

### <a name="output_instance_state"></a> [instance\_state](#output\_instance\_state)

Description: The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`

### <a name="output_primary_network_interface_id"></a> [primary\_network\_interface\_id](#output\_primary\_network\_interface\_id)

Description: The ID of the instance's primary network interface

### <a name="output_private_dns"></a> [private\_dns](#output\_private\_dns)

Description: The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC

### <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip)

Description: The private IP address assigned to the instance.

### <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns)

Description: The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC

### <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip)

Description: The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws\_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached
