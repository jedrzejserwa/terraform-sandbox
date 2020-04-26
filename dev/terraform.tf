terraform {
  required_version = ">= 0.12"

  backend "s3" {
    encrypt = true
    region = "eu-central-1"
    bucket = "terraform-sandbox-infrastructure-state-s3"
    key = "terraform.tfstate"
  }
}