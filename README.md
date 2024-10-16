# OVHCloud cluster module

## Usage
```hcl
module "ovh" {
  source  = "julzor42/cluster/ovh"
  version = "0.0.1"

  # If enabled is set to false, all node pools have a desired nodes value set to 0
  # and the ingress controller is uninstalled, so no balancer will be used
  enabled = true

  # Output kubeconfig file to generate
  kubeconfig = "~/.kube/config-ovh"

  application = {
    key          = "<...>"
    secret       = "<...>"
    consumer_key = "<...>"
  }

  cluster = {
    service_name = "<...>"
    name         = "cluster1"
    region       = "SBG5"
    version      = "1.31"
  }

  # Define a node pool, with one node (default is d2-4 discovery type)
  node_pools = [{ name = "pool-1", desired_nodes = 1 }]

  # Install an ingress controller
  # This will create an OVH LoadBalancer (default size is S)
  ingress = { name = "ing1" }
}
```