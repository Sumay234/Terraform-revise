# To run in the different environment

# terraform plan -var-file="stage.tfvars"


provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "creating-ec2" {
  ami = "ami-00beae93a2d981137"
  instance_type = var.instance_type

  tags = {
    Name = var.environment_type
  }
}