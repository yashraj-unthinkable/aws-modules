resource "aws_iam_role" "iam_role" {
  name                  = var.name
  assume_role_policy    = var.assume_role_policy
  managed_policy_arns   = var.managed_policy_arns
  force_detach_policies = var.force_detach_policies
  tags                  = var.tags
  max_session_duration  = var.max_session_duration
  dynamic "inline_policy" {
    for_each = var.inline_policy
    # for_each = length(var.inline_policy) > 0 ? [length(var.inline_policy)] : []
    content {
      name   = inline_policy.value["name"]
      policy = inline_policy.value["policy"]
    }
  }
}
