variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_ids" {
  description = "A map of OS to AMI IDs"
  type        = map(string)
  default = {
    "ubuntu"       = "ami-0dee22c13ea7a9a67"
    "amazon_linux" = "ami-08bf489a05e916bbd"
  }
}

variable "availability_zone" {
  description = "The availability zone to deploy resources"
  type        = string
  default     = "ap-south-1a"
}

variable "instance_os" {
  description = "The OS for the EC2 instance (ubuntu, amazon_linux)"
  type        = string
  default     = "ubuntu"
}

variable "instances" {
  description = "A map of instance configurations"
  type = map(object({
    os                = string
    instance_type     = string
    availability_zone = string
  }))
  default = {
    "instance_1" = {
      os                = "ubuntu",
      instance_type     = "t2.micro",
      availability_zone = "ap-south-1a"
    },
    "instance_2" = {
      os                = "amazon_linux",
      instance_type     = "t2.medium",
      availability_zone = "ap-south-1a"
    }
  }
}


variable "show_instance_details" {
  description = "Whether to show instance details in output"
  type        = bool
  default     = true
}
