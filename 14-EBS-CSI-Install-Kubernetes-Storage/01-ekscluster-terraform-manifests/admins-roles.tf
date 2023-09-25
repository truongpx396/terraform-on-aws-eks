module "admins-roles" {
  source = "./admins-roles"

  resource_name = local.name

  common_tags= local.common_tags

  eks_nodegroup_role_arn = aws_iam_role.eks_nodegroup_role.arn

  aws_eks_cluster=aws_eks_cluster.eks_cluster

  depends_on = [aws_eks_cluster.eks_cluster]
}