resource "ovh_cloud_project_kube_nodepool" "pool" {
  count          = length(var.node_pools)
  service_name   = ovh_cloud_project_kube.ovh-cluster.service_name
  kube_id        = ovh_cloud_project_kube.ovh-cluster.id
  name           = var.node_pools[count.index].name
  flavor_name    = var.node_pools[count.index].flavor_name
  desired_nodes  = var.enabled ? var.node_pools[count.index].desired_nodes : 0
  autoscale      = var.node_pools[count.index].autoscale
  min_nodes      = var.enabled ? var.node_pools[count.index].min_nodes : 0
  max_nodes      = var.node_pools[count.index].max_nodes
  monthly_billed = var.node_pools[count.index].monthly_billed
}
