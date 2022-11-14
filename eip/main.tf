# ########################################################################################S
# EIP Configurations
# create elastic IP
resource "aws_eip" "this" {
  vpc  = true
  tags = var.tags
}
