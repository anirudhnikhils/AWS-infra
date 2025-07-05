resource "aws_ecr_repository" "this" {
  name = var.repo_name

  image_tag_mutability = "MUTABLE"  # ya IMMUTABLE
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = var.repo_name
    Environment = var.env_name
  }
}
