# -----------------------------------------------------------------------------
# AWS Secrets Manager module
# -----------------------------------------------------------------------------

resource "aws_secretsmanager_secret" "this" {
  name = "${var.env_name}-db-credentials"
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
  })
}
