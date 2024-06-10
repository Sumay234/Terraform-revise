output "instance_public_ip" {
  value = aws_instance.ec2_module_2.public_ip
}

output "security_group_id" {
  value = aws_security_group.creating-SG-2.id
}

output "aws_instance" {
  value = aws_instance.ec2_module_2
}