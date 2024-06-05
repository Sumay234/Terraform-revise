## Using with local variable


provider "aws" {
  region = "us-east-1"


}

locals {
  staging_env = "staging"
}

resource "aws_vpc" "staging-local-vpc" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.staging_env}-local-vpc-tags"
  }
}

resource "aws_subnet" "staging-local-subnet" {
    vpc_id = aws_vpc.staging-local-vpc.id
    cidr_block = "10.5.0.0/16"

    tags = {
      Name = "${local.staging_env}-local-subnet-tags"
    }
}

resource "aws_instance" "staging-local-ec2" {
  ami = ""
  instance_type = "t2.micro"
  subnet_id = aws_subnet.staging-local-subnet.id

  tags = {
    Name = "${local.staging_env}-local-ec2-tags"
  }

}