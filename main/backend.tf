terraform {
  backend "s3" {
    bucket = "terraform-state-file-2-tier-app"
    key    = "backend/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "2-tier-app"
  }
}