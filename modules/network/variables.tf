# Project name used to dynamically name resources.
variable "project_name" {
  description = "Name of the project used as prefix for AWS resources"
  type        = string
}

# Main private IP range for the VPC.
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

# Public subnet IP range.
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

# AWS Availability Zone where the subnet will be created.
variable "availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
}

# Common tags applied to resources.
variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}