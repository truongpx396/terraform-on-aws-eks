
output "aws_auth" {
  description = "aws_auth configMap"
  value       = kubernetes_config_map_v1_data.aws_auth
}