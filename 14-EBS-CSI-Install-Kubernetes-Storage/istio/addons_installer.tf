data "kubectl_filename_list" "manifests" {
    pattern = "./addons/*"
}

resource "kubectl_manifest" "istio_addons_installer" {
    count = length(data.kubectl_filename_list.manifests.matches)
    yaml_body = file(element(data.kubectl_filename_list.manifests.matches, count.index))

    depends_on = [
    helm_release.istio,
  ]
}