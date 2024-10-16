terraform {
  required_providers {
    ovh = {
      source = "ovh/ovh"
    }
  }
}

provider "ovh" {
  endpoint           = var.application.endpoint
  application_key    = var.application.key
  application_secret = var.application.secret
  consumer_key       = var.application.consumer_key
}

provider "helm" {
  kubernetes {
    host                   = ovh_cloud_project_kube.ovh-cluster.kubeconfig_attributes[0].host
    client_certificate     = base64decode(ovh_cloud_project_kube.ovh-cluster.kubeconfig_attributes[0].client_certificate)
    client_key             = base64decode(ovh_cloud_project_kube.ovh-cluster.kubeconfig_attributes[0].client_key)
    cluster_ca_certificate = base64decode(ovh_cloud_project_kube.ovh-cluster.kubeconfig_attributes[0].cluster_ca_certificate)
  }
}

provider "kubernetes" {
  host                   = ovh_cloud_project_kube.ovh-cluster.kubeconfig_attributes[0].host
  client_certificate     = base64decode(ovh_cloud_project_kube.ovh-cluster.kubeconfig_attributes[0].client_certificate)
  client_key             = base64decode(ovh_cloud_project_kube.ovh-cluster.kubeconfig_attributes[0].client_key)
  cluster_ca_certificate = base64decode(ovh_cloud_project_kube.ovh-cluster.kubeconfig_attributes[0].cluster_ca_certificate)
}
