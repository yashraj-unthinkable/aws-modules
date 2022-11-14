data "aws_ami" "ec2" {
  most_recent = true

  filter {
    name   = "name"
    values = var.ami_name
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = var.ami_owners
}
