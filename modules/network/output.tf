# Exposes the VPC ID so other modules can use it.
output "vpc_id" {
  value = aws_vpc.main.id
}

# Exposes the public subnet ID so the EC2 instance can be placed inside it.
output "public_subnet_id" {
  value = aws_subnet.public.id
}