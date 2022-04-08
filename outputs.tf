output "cluster_password" {
  value = random_password.node_pool_password.result
}

output "kubeconfig" {
  value = sbercloud_cce_cluster.cluster.kube_config_raw
}

output "load_balancer_eip" {
  value = sbercloud_vpc_eip.cluster_lb_eip.address
}

output "load_balancer_id" {
  value = sbercloud_lb_loadbalancer.cluster_lb.id
}