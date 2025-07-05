# --------------------------
# AWS Region for prod
# --------------------------
variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

# --------------------------
# VPC CIDR block for prod
# --------------------------
variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.1.0.0/16"
}

# --------------------------
# Public Subnet CIDRs for prod
# --------------------------
variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24"]  # 2 public subnets
}

# --------------------------
# Private Subnet CIDRs for prod
# --------------------------
variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.1.3.0/24", "10.1.4.0/24"]  # 2 private subnets
}

# --------------------------
# Availability Zones for prod
# --------------------------
variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]  # 2 AZs
}

# --------------------------
# Environment name for prod
# --------------------------
variable "env_name" {
  description = "Environment name for tagging"
  default     = "prod"
}
