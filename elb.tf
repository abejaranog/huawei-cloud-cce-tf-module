resource "sbercloud_lb_loadbalancer" "cluster_lb" {
  name          = "${local.project_name}-k8s-cluster-lb"
  vip_subnet_id = data.sbercloud_vpc_subnet.private_subnet.subnet_id
}

resource "sbercloud_vpc_eip" "cluster_lb_eip" {
  publicip {
    type = "5_bgp"
  }

  bandwidth {
    name        = "${local.project_name}-k8s-cluster-lb-eip"
    size        = 5
    share_type  = "PER"
    charge_mode = "traffic"
  }
}

resource "sbercloud_networking_eip_associate" "eip_1" {
  public_ip = sbercloud_vpc_eip.cluster_lb_eip.address
  port_id   = sbercloud_lb_loadbalancer.cluster_lb.vip_port_id
}

# resource "sbercloud_lb_listener" "cluster_lb_listener_1" {
#   name            = "${sbercloud_lb_loadbalancer.cluster_lb.name}-http-listener"
#   protocol        = "HTTP"
#   protocol_port   = 80
#   loadbalancer_id = sbercloud_lb_loadbalancer.cluster_lb.id
# }

# resource "sbercloud_lb_pool" "cluster_lb_backend" {
#   name        = "${sbercloud_lb_loadbalancer.cluster_lb.name}-backend"
#   protocol    = "HTTP"
#   lb_method   = "ROUND_ROBIN"
#   listener_id = sbercloud_lb_listener.cluster_lb_listener_1.id

# }

# resource "sbercloud_lb_monitor" "backend_healthcheck" {
#   pool_id     = sbercloud_lb_pool.cluster_lb_backend.id
#   type        = "HTTP"
#   delay       = 5
#   timeout     = 3
#   max_retries = 3
#   url_path    = "/"
# }

# resource "sbercloud_lb_member" "cluster_nodes" {
#   count         = var.node_count
#   address       = sbercloud_cce_node.cluster_nodes[count.index].private_ip
#   protocol_port = var.node_expose_port
#   pool_id       = sbercloud_lb_pool.cluster_lb_backend.id
#   subnet_id     = data.sbercloud_vpc_subnet.private_subnet.subnet_id
#   depends_on    = [sbercloud_cce_node.cluster_nodes]
# }