#configure aws provider 
provider "aws" {
  region = var.region
}

# Creating VPC Module
module "VPC" {
  source                       = "../modules/vpc"
  project_name                 = var.project_name
  region                       = var.region
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
}

# Creating Nat gateway Module
module "natgateway" {
  source                      = "../modules/nat-gateway"
  vpc_id                      = module.VPC.vpc
  aws_internet_gateway        = module.VPC.aws_internet_gateway
  public_subnet_az1_id        = module.VPC.public_subnet_az1_id
  public_subnet_az2_id        = module.VPC.public_subnet_az2_id
  private_app_subnet_az1_id   = module.VPC.private_app_subnet_az1_id
  private_app_subnet_az2_id   = module.VPC.private_app_subnet_az2_id
  private_data_subnet_az1_id  = module.VPC.private_data_subnet_az1_id
  private_data_subnet_az2_id  = module.VPC.private_data_subnet_az2_id
}

# Creating Security group Module
module "security_group" {
  source                      = "../modules/security-group"
  vpc_id                      = module.VPC.vpc
}