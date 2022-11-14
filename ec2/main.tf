# ########################################################################################S
# EC2 Configurations
# create EC2 instance
resource "aws_instance" "this" {
  count                  = var.create ? 1 : 0
  ami                    = data.aws_ami.ec2.id
  instance_type          = var.instance_type
  user_data              = var.user_data
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  monitoring             = var.monitoring
  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      kms_key_id            = lookup(root_block_device.value, "kms_key_id", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
      throughput            = lookup(root_block_device.value, "throughput", null)
      tags                  = lookup(root_block_device.value, "tags", null)
    }
  }
  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      kms_key_id            = lookup(ebs_block_device.value, "kms_key_id", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
      throughput            = lookup(ebs_block_device.value, "throughput", null)
    }
  }
  disable_api_termination = var.disable_api_termination
  disable_api_stop        = var.disable_api_stop
  tags                    = merge({ "Name" = var.name }, var.tags)
}

# create elastic ip to attach to EC2 using EIP module
module "eip" {
  source = "https://github.com/yashrajdighe/aws-modules/tree/main/eip"
  count  = var.create && var.attach_eip ? 1 : 0
  tags   = merge({ "Name" = var.name }, var.tags)
}

# associate elastic ip to ec2 instance
resource "aws_eip_association" "this" {
  count               = var.create && var.attach_eip ? 1 : 0
  instance_id         = aws_instance.this[0].id
  allocation_id       = module.eip[0].eip_id[0]
  allow_reassociation = var.allow_reassociation
}
