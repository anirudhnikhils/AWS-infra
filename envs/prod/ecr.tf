module "app_ecr" {
  source    = "../../modules/ecr"
  repo_name = "cyber-sapient-staging"
  env_name  = "prod"
}
