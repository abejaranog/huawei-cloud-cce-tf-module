data "sbercloud_vpc" "vpc" {
  name = "${local.project_name}-vpc"
}

data "sbercloud_availability_zones" "availability_zones" {}

data "sbercloud_vpc_subnet" "public_subnet" {
  name = "${local.project_name}-public-subnet"
}

data "sbercloud_vpc_subnet" "private_subnet" {
  name = "${local.project_name}-private-subnet"
}

