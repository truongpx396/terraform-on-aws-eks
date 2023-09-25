module "admins-roles" {
  source = "./admins-roles"

  resource_name = local.name

  common_tags= local.common_tags

  depends_on = [aws_eks_cluster.eks_cluster]
}