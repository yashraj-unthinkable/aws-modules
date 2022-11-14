variable "vpc_id" {
  default     = ""
  type        = string
  description = "VPC ID in which security group to be created"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Mapping of tags to assign to Security Groups"
}

variable "sg" {
  default = []
  type    = any
}
