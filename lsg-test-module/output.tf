# Referencing outputs from the ec2-instance module
output "public_ipv4_address" {
  value = module.ec2-instance.public_ipv4_address
}

output "public_ipv4_addresses" {
  value = module.ec2-instance.public_ipv4_addresses
}

# Referencing the VPC ID output from the VPC module
output "vpc_id" {
  value = module.VPC.vpc
}

# Referencing security group IDs from the security_group module
output "alb_security_group_id" {
  value = module.security_group.alb_security_group_id
}

output "ecs_security_group_id" {
  value = module.security_group.ecs_security_group_id
}

output "public_security_group_id" {
  value = module.security_group.public_security_group_id
}

# Referencing subnet IDs from the VPC module
output "public_subnet_az1_id" {
  value = module.VPC.public_subnet_az1_id
}

output "public_subnet_az2_id" {
  value = module.VPC.public_subnet_az2_id
}

output "private_app_subnet_az1_id" {
  value = module.VPC.private_app_subnet_az1_id
}

output "private_app_subnet_az2_id" {
  value = module.VPC.private_app_subnet_az2_id
}

output "private_data_subnet_az1_id" {
  value = module.VPC.private_data_subnet_az1_id
}

output "private_data_subnet_az2_id" {
  value = module.VPC.private_data_subnet_az2_id
}

# Referencing internet gateway output from the VPC module
output "aws_internet_gateway" {
  value = module.VPC.aws_internet_gateway
  }
