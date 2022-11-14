resource "aws_security_group" "this" {
  count       = length(var.sg)
  vpc_id      = var.vpc_id
  name        = lookup(var.sg[count.index], "security_group_name")
  description = lookup(var.sg[count.index], "security_group_description")

  dynamic "ingress" {
    for_each = try(var.sg[count.index].ingress_rules, [])
    content {
      description = try(ingress.value["description"], null)
      from_port   = try(ingress.value["from_port"], null)
      to_port     = try(ingress.value["to_port"], null)
      protocol    = try(ingress.value["protocol"], null)
      cidr_blocks = try(ingress.value["cidr_blocks"], null)
    }
  }

  dynamic "egress" {
    for_each = try(var.sg[count.index].egress_rules, [])
    content {
      description = try(egress.value["description"], null)
      from_port   = try(egress.value["from_port"], null)
      to_port     = try(egress.value["to_port"], null)
      protocol    = try(egress.value["protocol"], null)
      cidr_blocks = try(egress.value["cidr_blocks"], null)
    }
  }

  tags = var.tags
}
