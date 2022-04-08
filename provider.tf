terraform {
  required_providers {
    sbercloud = {
      source  = "sbercloud-terraform/sbercloud"
      version = "~> 1.6.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.8.0"
    }
  }
}