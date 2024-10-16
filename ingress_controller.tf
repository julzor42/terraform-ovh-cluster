resource "kubernetes_namespace" "ingress-ns" {
  count      = var.ingress != null ? 1 : 0
  depends_on = [ovh_cloud_project_kube_nodepool.pool]
  metadata {
    name = var.ingress.namespace
  }
}

resource "helm_release" "ingress" {
  count            = (var.enabled && var.ingress != null) ? 1 : 0
  depends_on       = [kubernetes_namespace.ingress-ns]
  name             = var.ingress.name
  namespace        = var.ingress.namespace
  create_namespace = false
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  max_history      = "3"
  force_update     = false
  values = [
    <<HELMVALUES
  controller:
    service:
        annotations:
            service.beta.kubernetes.io/ovh-loadbalancer-size: ${var.ingress.loadbalancer_size}
  HELMVALUES
  ]
}
