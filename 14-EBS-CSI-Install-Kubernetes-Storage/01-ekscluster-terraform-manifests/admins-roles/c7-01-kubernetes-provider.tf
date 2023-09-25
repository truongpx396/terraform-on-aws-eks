# Datasource: 
data "aws_eks_cluster_auth" "cluster" {
  name = var.aws_eks_cluster.id
}

# Terraform Kubernetes Provider
provider "kubernetes" {
  host = var.aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(var.aws_eks_cluster.certificate_authority[0].data)
  token = data.aws_eks_cluster_auth.cluster.token
}