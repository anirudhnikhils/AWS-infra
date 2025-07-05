# AWS Region for staging
variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

# VPC CIDR block
variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

# Public Subnet CIDRs
variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

# Private Subnet CIDRs
variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}

# Availability Zones
variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}

# Environment name
variable "env_name" {
  description = "Environment name for tagging"
  default     = "staging"
}
