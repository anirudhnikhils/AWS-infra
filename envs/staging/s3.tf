# Call S3 logs bucket module
module "app_logs_s3" {
  source      = "../../modules/s3"
  bucket_name = "cyber-sapient-logs-staging"
  env_name    = "staging"
}