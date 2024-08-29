#For a Single Instance: If you only need the public IP address of a specific instance (e.g., the first one) 
#you can reference it directly by its index.
# print the ec2's public ipv4 address
output "private_ec2_instance_az1" {
  value =  aws_instance.private_ec2_instance_az1
}

output "private_ec2_instance_az2" {
  value = aws_instance.private_ec2_instance_az2.id
}
output "public_ec2_instance_az1" {
  value = aws_instance.public_ec2_instance_az1.id
}
output "public_ec2_instance_az2" {
  value = aws_instance.public_ec2_instance_az2.id
}

# Consolidated output for all private EC2 instance IDs
output "private_ec2_instance_ids" {
  value = [
    aws_instance.private_ec2_instance_az1.id,
    aws_instance.private_ec2_instance_az2.id
  ]
}

# Consolidated output for all public EC2 instance IDs
output "public_ec2_instance_ids" {
  value = [
    aws_instance.public_ec2_instance_az1.id,
    aws_instance.public_ec2_instance_az2.id
  ]
}