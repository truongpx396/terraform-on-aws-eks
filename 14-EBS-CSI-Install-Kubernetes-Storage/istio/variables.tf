variable "helm_namespace" {
  description = "The namespace Helm will install the chart under"
  default     = "istio-system"
}
variable "helm_release" {
  default     = "istio"
  description = "The name of the Helm release"
}

variable "helm_repository" {
  default     = "https://istio-release.storage.googleapis.com/charts"
  description = "The repository where the Helm chart is stored"
}

variable "chart_version" {
  description = "Version of the Helm chart"
  default     = "1.19.0"
}

variable "values" {
  default     = ""
  type        = string
  description = "Values to be passed to the Helm chart"
}