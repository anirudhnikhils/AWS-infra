# Ye staging ke main.tf ya ecr.tf me hai:
module "app_ecr" {
  source    = "../../modules/ecr"  # Tera ECR reusable module
  repo_name = "my-app-staging"     # 👈 Ye staging ke liye unique repo name
  env_name  = "staging"            # 👈 Ye tag ke liye env name
}
