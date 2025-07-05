terraform {
  backend "s3" {
    bucket         = "cyber-sappient-bucket"
    key            = "staging/terraform.tfstate" 
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terrafrm-lock-tabel" 
  }
}
