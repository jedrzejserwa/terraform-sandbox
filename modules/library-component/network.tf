resource "aws_key_pair" "terraform_sandbox_ec2_key" {
  key_name = var.key_pair_name
  public_key = file(var.public_key_path)
}

resource "aws_vpc" "terraform_sandbox_vpc" {
  cidr_block = var.vpc_cidr_block_range
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "terraform_sandbox_vpc"
    Environment = var.environment_tag
  }
}

resource "aws_internet_gateway" "terraform_sandbox_gateway" {
  vpc_id = aws_vpc.terraform_sandbox_vpc.id

  tags = {
    Name = "terraform_sandbox_gateway"
    Environment = var.environment_tag
  }
}

resource "aws_subnet" "terraform_sandbox_public_subnet" {
  vpc_id = aws_vpc.terraform_sandbox_vpc.id
  cidr_block = var.public_subnet_cidr_block_range
  availability_zone = var.availability_zone

  tags = {
    Name = "terraform_sandbox_public_subnet"
    Environment = var.environment_tag
    Type = "Public"
  }
}

resource "aws_route_table" "terraform_sandbox_route_table_public" {
  vpc_id = aws_vpc.terraform_sandbox_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_sandbox_gateway.id
  }

  tags = {
    Name = "terraform_sandbox_route_table_public"
    Environment = var.environment_tag
  }
}

resource "aws_route_table_association" "terraform_sandbox_route_table_asso_public_subnet" {
  subnet_id = aws_subnet.terraform_sandbox_public_subnet.id
  route_table_id = aws_route_table.terraform_sandbox_route_table_public.id
}


resource "aws_security_group" "terraform_sandbox_sg" {
  name = "terraform_sandbox_sg"
  vpc_id = aws_vpc.terraform_sandbox_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment_tag
  }
}