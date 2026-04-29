# Project name used as prefix for resource names.
variable "project_name" {
  description = "Name of the project used as prefix for AWS resources"
  type        = string
}

# ID of the VPC where the security group will be created.
variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

# ID of the public subnet where the EC2 instance will run.
variable "public_subnet_id" {
  description = "Public subnet ID where the EC2 instance will be created"
  type        = string
}

# AMI is the operating system image used by the EC2 instance.
variable "ami_id" {
  description = "AMI ID used to launch the EC2 instance"
  type        = string
}

# EC2 size/type.
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

# Name shown in the HTML page.
variable "owner_name" {
  description = "Name displayed in the web page"
  type        = string
}

# CIDR allowed to access HTTP.
# 0.0.0.0/0 means anyone on the internet.
variable "allowed_http_cidr" {
  description = "CIDR block allowed to access the web server on port 80"
  type        = string
}

# Common tags applied to resources.
variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}