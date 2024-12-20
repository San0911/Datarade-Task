provider "aws" {
  region = "us-east-1"
}

# Include all resource files
module "network" {
  source = "./terraform/network.tf"
}

module "ec2" {
  source = "./terraform/ec2.tf"
}

module "rds" {
  source = "./terraform/rds.tf"
}

module "security_groups" {
  source = "./terraform/security_groups.tf"
}

module "backend" {
  source = "./terraform/backend.tf"
}
