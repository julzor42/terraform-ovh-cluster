variable "enabled" {
  type    = bool
  default = true
}

variable "cluster" {
  type = object({
    name         = string
    service_name = string
    version      = optional(string, "1.31")
    region       = string
  })
}

variable "application" {
  type = object({
    endpoint     = optional(string, "ovh-eu")
    key          = string
    secret       = string
    consumer_key = string
  })
}

variable "node_pools" {
  type = list(object({
    name           = string
    desired_nodes  = optional(number, 1)
    min_nodes      = optional(number, 0)
    max_nodes      = optional(number, 1)
    monthly_billed = optional(bool, false)
    flavor_name    = optional(string, "d2-4")
    autoscale      = optional(bool, false)
  }))

  default = []
}

variable "ingress" {
  type = object({
    namespace         = optional(string, "ingress")
    name              = string
    loadbalancer_size = optional(string, "S")
  })
  nullable = true
  default  = null
}

variable "kubeconfig" {
  type    = string
  default = ""
}
