variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "db_name" {
  description = "DB name"
  type        = string
}

variable "instance_class" {
  description = "Instance class"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "engine" {
  description = "DB engine"
  type        = string
}

variable "engine_version" {
  description = "Engine version"
  type        = string
}

variable "db_username" {
  description = "DB username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "DB password"
  type        = string
  sensitive   = true
}

variable "vpc_security_group_ids" {
  description = "List of SG IDs"
  type        = list(string)
}

variable "db_subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "multi_az" {
  description = "Enable Multi AZ?"
  type        = bool
  default     = false
}
