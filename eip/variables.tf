variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to all resources related to EIP"
}
