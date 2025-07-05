variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "db_username" {
  description = "DB username to store"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "DB password to store"
  type        = string
  sensitive   = true
}
