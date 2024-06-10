output "instance_public_ip" {
  value = aws_instance.ec2_module_1.public_ip
}

output "security_group_id" {
  value = aws_security_group.creating-SG.id
}

output "aws_instance" {
  value = aws_instance.ec2_module_1
}