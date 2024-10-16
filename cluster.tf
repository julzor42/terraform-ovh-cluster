resource "ovh_cloud_project_kube" "ovh-cluster" {
  service_name = var.cluster.service_name
  name         = var.cluster.name
  region       = var.cluster.region
  version      = var.cluster.version
}

resource "local_file" "kubeconfig" {
  count    = var.kubeconfig != "" ? 1 : 0
  content  = ovh_cloud_project_kube.ovh-cluster.kubeconfig
  filename = var.kubeconfig
}

output "kubeconfig" {
  value     = ovh_cloud_project_kube.ovh-cluster.kubeconfig
  sensitive = true
}
