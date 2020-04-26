variable "profile" {
  default = "terraform_sandbox"
}

variable "region" {
  default = "eu-central-1"
}

variable "shared_credentials_file" {
  default = "/root/.aws/credentials"
}

variable "environment_tag" {
  description = "Environment tag"
  default = "dev"
}

variable "availability_zone" {
  default = "eu-central-1a"
}

variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/TerraformSandbox.pub"
}

variable "private_key_path" {
  description = "Private key path"
  default = "~/.ssh/TerraformSandbox.pem"
}

variable "key_pair_name" {
  description = "EC2 Key pair name"
  default = "TerraformSandbox"
}

variable "vpc_cidr_block_range" {
  description = "The CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block_range" {
  description = "The CIDR block for public subnet of VPC"
  default = "10.0.0.0/24"
}