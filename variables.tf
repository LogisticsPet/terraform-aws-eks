variable "stack" {
  type        = string
  description = "stack name"
}

variable "cluster_name" {
  type        = string
  description = "cluster name"
}

variable "vpc_id" {
  type        = string
  description = "ID of AWS VPC"
}

variable "public_subnet_ids" {
  description = "IDs of public subnets"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "IDs of private subnets"
  type        = list(string)
}

variable "intra_subnet_ids" {
  description = "IDs of intra subnets"
  type        = list(string)
}

variable "tags" {
  description = "A map of additional tags to add to the vpc"
  type        = map(string)
  default     = {}
}
