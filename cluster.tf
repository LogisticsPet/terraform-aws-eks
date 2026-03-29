module "eks" {
  source                                   = "terraform-aws-modules/eks/aws"
  version                                  = "20.37.2"
  cluster_name                             = var.cluster_name != null ? var.cluster_name : "${var.stack}-eks"
  cluster_endpoint_public_access           = true
  create_cluster_security_group            = true
  cluster_security_group_name              = "${var.stack}-eks-sg"
  cluster_security_group_use_name_prefix   = false
  enable_cluster_creator_admin_permissions = true

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.private_subnet_ids
  # control_plane_subnet_ids = var.intra_subnet_ids

  tags = var.tags
}

resource "aws_ec2_tag" "private_subnet_elb" {
  for_each    = toset(var.private_subnet_ids)
  resource_id = each.key
  key         = "kubernetes.io/role/internal-elb"
  value       = "1"
}

resource "aws_ec2_tag" "private_subnet_karpenter" {
  for_each    = toset(var.private_subnet_ids)
  resource_id = each.key
  key         = "karpenter.sh/discovery"
  value       = module.eks.cluster_name
}

resource "aws_ec2_tag" "public_subnet_elb" {
  for_each    = toset(var.public_subnet_ids)
  resource_id = each.key
  key         = "kubernetes.io/role/elb"
  value       = "1"
}
