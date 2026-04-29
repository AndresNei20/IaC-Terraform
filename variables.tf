# AWS region where resources will be created.
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

# Project name used as prefix for resource names.
variable "project_name" {
  description = "Project name used to name resources"
  type        = string
  default     = "iac-homework"
}

# Your name displayed in the web page.
variable "owner_name" {
  description = "Name displayed in the HTML page"
  type        = string
  default     = "Andres"
}

# VPC private IP range.
variable "vpc_cidr" {
  description = "CIDR block for the custom VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Public subnet private IP range.
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Availability zone where the subnet will be created.
variable "availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "us-east-2a"
}

# Ubuntu AMI used by the EC2 instance.
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

# EC2 instance size.
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# CIDR allowed to access the website.
variable "allowed_http_cidr" {
  description = "CIDR block allowed to access HTTP port 80"
  type        = string
  default     = "0.0.0.0/0"
}

# Common tags applied to resources.
variable "tags" {
  description = "Common tags for all AWS resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "iac-homework"
    ManagedBy   = "terraform"
  }
}