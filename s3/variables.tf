variable "bucket_name" {
  type        = string
  description = "Name of the bucket to be created"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to S3 bucket"
}
