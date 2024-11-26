output "vpc_cidr_block" {
  description = "The CIDR block of the created VPC"
  value       = aws_vpc.main.cidr_block
}

output "instance_details" {
  description = "Details of created instances"
  value       = var.show_instance_details ? { for idx, instance in aws_instance.example : idx => instance.public_ip } : {}
}

output "default_security_group_id" {
  value = data.aws_security_group.default_sg.id
  description = "The ID of the default security group"
}

output "default_security_group_name" {
  value = data.aws_security_group.default_sg.name
  description = "The name of the default security group"
}
