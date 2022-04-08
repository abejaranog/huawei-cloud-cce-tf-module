# Terraform CCE Module
## Description

Terraform module to deploy a CCE cluster in Huawei Cloud

## Project Diagram
![](https://support.huaweicloud.com/intl/en-us/usermanual-cce/en-us_image_0000001163928763.png)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.8.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.1.0 |
| <a name="requirement_sbercloud"></a> [sbercloud](#requirement\_sbercloud) | ~> 1.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.1.0 |
| <a name="provider_sbercloud"></a> [sbercloud](#provider\_sbercloud) | ~> 1.6.0 |

## Resources

| Name | Type |
|------|------|
| [random_password.node_pool_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [sbercloud_cce_cluster.cluster](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/resources/cce_cluster) | resource |
| [sbercloud_cce_node.cluster_nodes](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/resources/cce_node) | resource |
| [sbercloud_lb_loadbalancer.cluster_lb](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/resources/lb_loadbalancer) | resource |
| [sbercloud_networking_eip_associate.eip_1](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/resources/networking_eip_associate) | resource |
| [sbercloud_vpc_eip.cluster_eip](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/resources/vpc_eip) | resource |
| [sbercloud_vpc_eip.cluster_lb_eip](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/resources/vpc_eip) | resource |
| [sbercloud_availability_zones.availability_zones](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/data-sources/availability_zones) | data source |
| [sbercloud_vpc.vpc](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/data-sources/vpc) | data source |
| [sbercloud_vpc_subnet.private_subnet](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/data-sources/vpc_subnet) | data source |
| [sbercloud_vpc_subnet.public_subnet](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/data-sources/vpc_subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_flavor_id"></a> [cluster\_flavor\_id](#input\_cluster\_flavor\_id) | Defaults up to 50 nodes HA Cluster | `string` | `"cce.s2.small"` | no |
| <a name="input_container_network_type"></a> [container\_network\_type](#input\_container\_network\_type) | Kind of network of the containers, by default overlay l2 | `string` | `"overlay_l2"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | defaults to 2 | `number` | `2` | no |
| <a name="input_node_flavor_id"></a> [node\_flavor\_id](#input\_node\_flavor\_id) | defaults to s3.large.4 | `string` | `"c6.large.4"` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_password"></a> [cluster\_password](#output\_cluster\_password) | n/a |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | n/a |
| <a name="output_load_balancer_eip"></a> [load\_balancer\_eip](#output\_load\_balancer\_eip) | n/a |
| <a name="output_load_balancer_id"></a> [load\_balancer\_id](#output\_load\_balancer\_id) | n/a |

## Additional info
[How to expose services in CCE cluster in Huawei Cloud](https://support.huaweicloud.com/intl/en-us/usermanual-cce/cce_01_0014.html)