resource "aws_instance" "terraform_sandbox_instance" {
  ami = var.instance_ami
  availability_zone = var.availability_zone
  instance_type = var.instance_type

  key_name = aws_key_pair.terraform_sandbox_ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.terraform_sandbox_sg.id]

  subnet_id = aws_subnet.terraform_sandbox_public_subnet.id
  associate_public_ip_address = true
  source_dest_check = false

  tags = {
    Name = "terraform_sandbox_instance"
    Environment = var.environment_tag
  }

  connection {
    host = self.public_ip
    user = var.ssh_user
    private_key = file(var.private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait",
      "whoami"
    ]
  }

  provisioner "local-exec" {
    working_dir = "../modules/library-component"
    command = "sh sample-script.sh ${self.public_ip}"
  }
}