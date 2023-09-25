
variable "resource_name" {
  description = "Name of the resource"
  type        = string
  default     = "hr-dev"
}

variable "common_tags" {
  description = "common tags"
  type        = map(string)
  default     = {}
}

variable "eks_nodegroup_role_arn" {
  description = "nodegroup role arn"
  type        = string
}

variable aws_eks_cluster {
  description = "eks cluster"
  type = object({

  })
}