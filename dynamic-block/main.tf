provider "aws" {
  region = "us-east-1"
}

locals {
  ingress_rules = [{
    port = 22
    description = "Ingress rule for the port 22"
  }
  {
    port = 443
    description = "Ingress rule for the port 443"
  }
  ]
}

resource "aws_instance" "ec2_example" {
  ami = ""
  instance_type = "t2.micro"
#  key_name = "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_security_group" "main" {
  egress = [
    {
        cidr_blocks = ["0.0.0.0/0"]
        description = ""
        from_port = 0
        to_port = 0
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        protocol = "-1"
    }
  ]

dynamic "ingress" {
  for_each = local.ingress_rules

  content {
    description = ingress.value.description
    from_port = ingress.value.from_port
    to_port = ingress.value.to_port
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

}