provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_creating" {
  ami = ""
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform ec2"
  }
}

output "my_console_output" {
    value = aws_instance.ec2_creating.public_ip
}

