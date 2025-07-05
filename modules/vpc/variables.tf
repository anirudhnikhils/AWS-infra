# ---------------------------------------------
# VPC CIDR block, example: "10.0.0.0/16"
# ---------------------------------------------
variable "vpc_cidr" {
  description = "VPC CIDR block"
}

# ---------------------------------------------
# Public Subnet CIDRs, example: ["10.0.1.0/24"]
# ---------------------------------------------
variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

# ---------------------------------------------
# Private Subnet CIDRs, example: ["10.0.2.0/24"]
# ---------------------------------------------
variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

# ---------------------------------------------
# Availability Zones list, example: ["ap-south-1a", "ap-south-1b"]
# ---------------------------------------------
variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

# ---------------------------------------------
# Environment name for tagging, like staging/prod
# ---------------------------------------------
variable "env_name" {
  description = "Environment name for tagging"
}
