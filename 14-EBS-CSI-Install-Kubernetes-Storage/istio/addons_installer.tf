data "kubectl_filename_list" "manifests_addons_extras" {
    pattern = "./addons/extras/*.yaml"
}

resource "kubectl_manifest" "istio_addons_extras_installer" {
    for_each  = toset(data.kubectl_path_documents.manifests_addons_extras.documents)
    yaml_body = each.value

    depends_on = [
    helm_release.istio,
  ]
}

data "kubectl_filename_list" "manifests" {
    pattern = "./addons/*.yaml"
}

resource "kubectl_manifest" "istio_addons_installer" {
    for_each  = toset(data.kubectl_path_documents.manifests.documents)
    yaml_body = each.value

    depends_on = [
    kubectl_manifest.istio_addons_extras_installer,
  ]
}