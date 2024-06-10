terraform {
  required_version = ">=0.12"
}

resource "aws_instance" "ec2_module_2" {
  ami = var.ami_id
  instance_type = var.instace_type
  vpc_security_group_ids = [aws_security_group.creating-SG-2.id]
  tags = {
    Name = "apache-webserver-2"
  }

  # installing apache script (bash-script)
   user_data = <<-EOF
        #!/bin/sh
        sudo apt-get update
        sudo apt install -y apache2
        sudo systemctl status apache2
        sudo systemctl start apache2
        sudo chown -R $USER:$USER /var/www/html
        sudo echo "<html><body><h1>Hello this is module-2 created by SUMAY-ch how are you at instance id `curl http://169.254.169.254/latest/meta-data/instance-id` </h1></body></html>" > /var/www/html/index.html
        EOF


}

resource "aws_security_group" "creating-SG-2" {
  name = "EC2-webserver-SG-2"
  description = "this is for another EC2"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}