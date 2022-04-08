variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "cluster_flavor_id" {
  type        = string
  default     = "cce.s2.small"
  description = "Defaults up to 50 nodes HA Cluster"
}

variable "container_network_type" {
  type        = string
  default     = "overlay_l2"
  description = "Kind of network of the containers, by default overlay l2"
}

variable "node_flavor_id" {
  type        = string
  default     = "c6.large.4"
  description = "defaults to s3.large.4"
}

# variable "initial_node_count" {
#   type        = number
#   default     = 0
#   description = "defaults to 0"
# }

variable "node_count" {
  type        = number
  default     = 2
  description = "defaults to 2"
}

# variable "max_node_count" {
#   type        = number
#   default     = 5
#   description = "defaults to 5"
# }

# variable "scale_down_cooldown_time" {
#   type        = number
#   default     = 5
#   description = "Interval between two scaling operations, in minutes."
# }

# variable "node_type" {
#   type        = string
#   default     = "vm"
#   description = "vm or ElasticBMS, defaults to vm"
# }