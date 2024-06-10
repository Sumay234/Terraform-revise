terraform {
  required_version = ">=0.12"
}

resource "aws_instance" "ec2_module_1" {
  ami = var.ami_id
  instance_type = var.instace_type
  vpc_security_group_ids = [aws_security_group.creating-SG.id]
  tags = {
    Name = "apache-webserver-1"
  }
# key_name = "aws_key" # its a key pair value 


# installing apache script (bash-script)
   user_data = <<-EOF
        #!/bin/sh
        sudo apt-get update
        sudo apt install -y apache2
        sudo systemctl status apache2
        sudo systemctl start apache2
        sudo chown -R $USER:$USER /var/www/html
        sudo echo "<html><body><h1>Hello this is module-1 created by SUMAY at instance id  </h1></body></html>" > /var/www/html/index.html
        EOF


}


resource "aws_security_group" "creating-SG" {
  name = "EC2-webserver-SG-1"
  description = "this is Security group for webserver EC2 modulle-1"

  ingress {
    from_port = 80
    protocol = "TCP"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}