# This is the root main.tf.
# It does not create resources directly anymore.
# Instead, it calls reusable modules.

# Network module creates:
# - VPC
# - Public subnet
# - Internet Gateway
# - Route Table
# - Route Table Association
module "network" {
  source = "./modules/network"

  project_name       = var.project_name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
  tags               = var.tags
}

# Compute module creates:
# - Security Group
# - EC2 instance
# - nginx web server
module "compute" {
  source = "./modules/compute"

  project_name       = var.project_name
  vpc_id             = module.network.vpc_id
  public_subnet_id   = module.network.public_subnet_id
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  owner_name         = var.owner_name
  allowed_http_cidr  = var.allowed_http_cidr
  tags               = var.tags
}