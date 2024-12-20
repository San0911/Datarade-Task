provider "aws" {
  region = "us-east-1"
}

# Include all resource files
module "network" {
  source = "./network.tf"
}

module "ec2" {
  source = "./ec2.tf"
}

module "rds" {
  source = "./rds.tf"
}

module "security_groups" {
  source = "./security_groups.tf"
}
