# --- Secrets Manager ---
locals {
  db_username = "stagingadmin"
  db_password = "stagingpassword123"
}

module "db_secrets" {
  source       = "../../modules/secrets_manager"
  env_name     = var.env_name
  db_username  = local.db_username
  db_password  = local.db_password
}