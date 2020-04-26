output "terraform_sandbox_instance_public_ip" {
  value = aws_instance.terraform_sandbox_instance.public_ip
}