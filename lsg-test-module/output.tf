# Referencing outputs from the ec2-instance module
output "public_ec2_instance_az1" {
  value = module.ec2-instance.public_ec2_instance_az1
}

output "public_ec2_instance_az2" {
  value = module.ec2-instance.public_ec2_instance_az2
}

# Referencing the VPC ID output from the VPC module
output "vpc_id" {
  value = module.VPC.vpc
}

# Referencing security group IDs from the security_group module
output "nlb_security_group_id" {
  value = module.security_group.nlb_security_group_id
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

# Referencing internet gateway output from VPC module 
output "aws_internet_gateway" {
  value = module.VPC.aws_internet_gateway
  }
