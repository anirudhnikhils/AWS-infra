output "db_endpoint" {
  description = "DB endpoint"
  value       = aws_db_instance.this.endpoint
}

output "db_instance_arn" {
  description = "ARN of DB instance"
  value       = aws_db_instance.this.arn
}

output "db_subnet_group_name" {
  description = "Subnet group name"
  value       = aws_db_subnet_group.this.name
}
