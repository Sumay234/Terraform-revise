# Code without using Local Variable
# Without using local vaariable when we will change staging 
# or the name of encv it will take time and we have t0 change all manually


provider "aws" {
    region = "us-east-1"


}

resource "aws_vpc" "staging-vpc" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "staging-vpc-tag"
  }
}

resource "aws_subnet" "staging-subnet" {
  vpc_id = aws_vpc.staging-vpc.id
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "staging-subnet-tag"
  }
}

resource "aws_instance" "ec2" {
  ami = ""
  instance_type = "t2.micro"
  subnet_id = aws_subnet.staging-subnet.id

  tags = {
    Name = "Staging-Terraform-ec2"
  }
}