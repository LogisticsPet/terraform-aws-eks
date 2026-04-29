terraform {
  required_version = "1.15.0"
  required_providers {
    aws = {
      version = "5.100.0"
      source  = "hashicorp/aws"
    }
    cloudinit = {
      version = "2.3.7"
      source  = "hashicorp/cloudinit"
    }
    kubernetes = {
      version = "3.0.1"
      source  = "hashicorp/kubernetes"
    }
    time = {
      version = "0.13.1"
      source  = "hashicorp/time"
    }
    tls = {
      version = "4.2.1"
      source  = "hashicorp/tls"
    }
    null = {
      version = "3.2.4"
      source  = "hashicorp/null"
    }
  }
}
