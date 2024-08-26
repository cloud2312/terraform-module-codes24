#For a Single Instance: If you only need the public IP address of a specific instance (e.g., the first one) 
#you can reference it directly by its index.
# print the ec2's public ipv4 address
output "public_ipv4_address" {
  value =  aws_instance.ec2_instance[0].public_ip
}

#For Multiple Instances: If you want to output the public IP addresses of all instances
#you can use a for loop to iterate over the instances.
output "public_ipv4_addresses" {
  value = [for instance in aws_instance.ec2_instance : instance.public_ip]
}
