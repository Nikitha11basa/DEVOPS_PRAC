provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

data "aws_security_group" "default_sg" {
  name = "default"  
  vpc_id = data.aws_vpc.default.id
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_instance" "example" {
 for_each = var.instances 
 ami = lookup(var.ami_ids, var.instance_os, null)
 instance_type = var.instance_type
 availability_zone = var.availability_zone

  tags = {
    Name = format("instance-%s-%s", var.instance_os, var.instance_type)
  }
}

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
