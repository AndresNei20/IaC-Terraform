# Creates a custom VPC.
# A VPC is your private network inside AWS.
resource "aws_vpc" "main" {
  # CIDR block defines the IP range available inside this VPC.
  # /16 gives us many private IPs: 10.0.0.0 - 10.0.255.255
  cidr_block = var.vpc_cidr

  # Allows AWS resources inside the VPC to use DNS names.
  enable_dns_support = true

  # Allows EC2 instances to get public DNS hostnames when public IPs are assigned.
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    Name = "${var.project_name}-vpc"
  })
}

# Creates a public subnet inside the VPC.
# A subnet is a smaller network segment inside the VPC.
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id

  # CIDR block for this subnet.
  # It must be inside the VPC CIDR range.
  cidr_block = var.public_subnet_cidr

  # This chooses the AWS Availability Zone where the subnet lives.
  availability_zone = var.availability_zone

  # Automatically gives public IPs to instances launched in this subnet.
  # This helps make the EC2 instance reachable from the internet.
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = "${var.project_name}-public-subnet"
  })
}

# Creates an Internet Gateway.
# This is the "door" that lets the VPC communicate with the internet.
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.tags, {
    Name = "${var.project_name}-igw"
  })
}

# Creates a route table for public internet traffic.
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  # This route means:
  # Any traffic going to the internet should go through the Internet Gateway.
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-public-rt"
  })
}

# Connects the route table to the public subnet.
# Without this, the subnet would not know how to reach the internet.
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}