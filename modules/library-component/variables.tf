variable "availability_zone" {
  default = ""
}

variable "private_key_path" {
  description = "Private key path"
  default = ""
}

variable "key_pair_name" {
  description = "EC2 Key pair name"
  default = ""
}

variable "public_key_path" {
  description = "Public key path"
  default = ""
}

variable "public_subnet_cidr_block_range" {
  description = "The CIDR block for public subnet of VPC"
  default = ""
}

variable "vpc_cidr_block_range" {
  description = "The CIDR block for the VPC"
  default = ""
}

variable "environment_tag" {
  description = "Environment tag"
  default = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "instance_ami" {
  description = "EC2 instance ami"
  default = "ami-9ebe18f1"
}

variable "ssh_user" {
  default = "ec2-user"
}