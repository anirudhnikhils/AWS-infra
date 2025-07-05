# --------------------------
#Outputs
# --------------------------
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}
# --------------------------
#s3 outputs
# --------------------------

output "app_logs_bucket" {
  value = module.app_logs_s3.bucket_name
}
# --------------------------
# secrets
# --------------------------
output "secret_arn" {
  value = module.db_secrets.secret_arn
}
# --------------------------
# rds
# --------------------------
output "db_endpoint" {
  value = module.rds.db_endpoint
}

# --------------------------
# ecr
# --------------------------

output "ecr_repo_url" {
  value = module.app_ecr.repository_url
}
