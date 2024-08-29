#configure aws provider 
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.66"

    }
  }
}

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

#  Creating EC2-instance module
module "ec2-instance" {
  source                        = "../modules/ec2-instance"
  public_subnet_az1_id          = module.VPC.public_subnet_az1_id
  public_subnet_az2_id          = module.VPC.public_subnet_az2_id
  public_security_group_id      = module.security_group.public_security_group_id
  private_app_subnet_az1        = module.VPC.private_app_subnet_az1_id
  private_app_subnet_az2        = module.VPC.private_app_subnet_az2_id
  nlb_security_group_id         = module.security_group.nlb_security_group_id
#  target_group_arn             = [module.nlb.aws_lb_target_group.tg.arn]
}

# Creating a NLB module 
module "nlb" {
  source                        = "../modules/nlb"
  private_app_subnet_az1_id     = module.VPC.private_app_subnet_az1_id
  private_app_subnet_az2_id     = module.VPC.private_app_subnet_az2_id
  vpc_id                        = module.VPC.vpc
  project_name                  = var.project_name
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  count = length(module.ec2-instance.private_ec2_instance_ids)

  target_group_arn = module.nlb.aws_lb_target_group_arn
  target_id        = element(module.ec2-instance.private_ec2_instance_ids, count.index)
  port             = 80
}
