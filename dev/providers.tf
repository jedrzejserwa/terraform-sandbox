provider "aws" {
  region = var.region
  profile = var.profile
  shared_credentials_file = var.shared_credentials_file
  version = "2.59"
}