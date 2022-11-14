variable "name" {
  type        = string
  description = "Friendly name of the role"
}

variable "assume_role_policy" {
  type        = string
  description = "Policy that grants an entity permission to assume the role."
  default     = ""
}

variable "managed_policy_arns" {
  type        = list(any)
  description = "Set of exclusive IAM managed policy ARNs to attach to the IAM role."
  default     = []
}

variable "max_session_duration" {
  default     = 3600
  description = "Maximum session duration (in seconds) that you want to set for the specified role"
  type        = number
}

variable "inline_policy" {
  type    = list(any)
  default = []
}

variable "force_detach_policies" {
  type        = string
  default     = false
  description = "Whether to force detach any policy"
}

variable "tags" {
  type        = map(string)
  description = "Key-value mapping of tags for the IAM role"
}
