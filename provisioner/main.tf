# To create a key pair value from gitbash use the command
# ssh-keygen -t rsa -b 2048


provider "aws" {
  region = "us-east-1"
  access_key = 
  secret_key = 
}

resource "aws_instance" "ec2_creating" {
  ami = "ami-00beae93a2d981137"
  instance_type = "t2.micro"
  key_name = "sumay-key"
  vpc_security_group_ids = [aws_security_group.main.id]
  
}

provisioner "file" {
    source = "/Users/Sumay Chatterjee/Downloads/abc.txt"
    destination = "/home/ubuntu/abc.txt"
}

connection {
    type = "ssh"
    host = self.public_ip
    user = "ubuntu"
    private_key = file()
    timeout

}

resource "aws_key_pair" "deployer" {
  key_name = "sumay-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD9G3RcN3FOY6QhRBMjWmiKJHJzFDmUJtY63oJjdxEj1okSoaTIhoYbfz0y+vObteTGpuSMwjNr4s57/AIulJKTnrW/qiAtomDz8swTpqvpZ/l1qmRXa+QuJCKYJnwCROSht0Sq4WBbWgHaesqPdEwonnz1HnNtLpFHetMUwik7KhdOUX22yQbXp2JIX7Rx1BMWlIYKq47q0u5V+qf6cqtG+ZKQNq4ytqgb4IvWaBAB+HF3YCvettvpV5Ag2alwFwWXYCmW9R76+Vi3WVkwyIPdw4AacHBXh2EVLve1rgM6yOscwKfsl41Q06gpmZVGtwvRX1H5H+O/qz2QwJ0EXDG1 Sumay Chatterjee@Sumay
"
}