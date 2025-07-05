module "app_logs_s3" {
  source      = "../../modules/s3"
  bucket_name = "cyber-sapient-logs-prod"
  env_name    = "prod"
}