resource "sbercloud_cce_cluster" "cluster" {
  name                   = "${local.project_name}-k8s-cluster"
  flavor_id              = var.cluster_flavor_id
  vpc_id                 = data.sbercloud_vpc.vpc.id
  subnet_id              = data.sbercloud_vpc_subnet.public_subnet.id
  container_network_type = var.container_network_type
  eip                    = sbercloud_vpc_eip.cluster_eip.address
}

resource "sbercloud_cce_node" "cluster_nodes" {
  count             = var.node_count
  cluster_id        = sbercloud_cce_cluster.cluster.id
  name              = "${local.project_name}-k8s-cluster-node-${count.index}"
  flavor_id         = var.node_flavor_id
  availability_zone = data.sbercloud_availability_zones.availability_zones.names[0]
  password          = random_password.node_pool_password.result
  os                = "CentOS 7.6"
  subnet_id         = data.sbercloud_vpc_subnet.private_subnet.id
  root_volume {
    size       = 40
    volumetype = "SAS"
  }
  data_volumes {
    size       = 100
    volumetype = "SAS"
  }
}

# resource "sbercloud_cce_node_pool" "node_pool" {
#   cluster_id               = sbercloud_cce_cluster.cluster.id
#   name                     = "${local.project_name}-node-pool"
#   os                       = "CentOS 7.6"
#   subnet_id = data.sbercloud_vpc_subnet.private_subnet.id
#   initial_node_count       = var.initial_node_count
#   flavor_id                = var.node_flavor_id
#   # scall_enable             = true
#   min_node_count           = var.min_node_count
#   max_node_count           = var.max_node_count
#   scale_down_cooldown_time = var.scale_down_cooldown_time
#   priority                 = 1
#   type                     = var.node_type
#   password                 = random_password.node_pool_password.result
#   root_volume {
#     size       = 40
#     volumetype = "SAS"
#   }
#   data_volumes {
#     size       = 100
#     volumetype = "SAS"
#   }
# }

resource "random_password" "node_pool_password" {
  length = 16
}

resource "sbercloud_vpc_eip" "cluster_eip" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    share_type  = "PER"
    name        = "${local.project_name}-k8s-cluster-eip"
    size        = 10
    charge_mode = "traffic"
  }
}