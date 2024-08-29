variable "ec2-instance_type" {
  description = "type od ec2 instance"
  default = "t2.micro"
}
variable "public_subnet_az1_id" {}
variable "public_subnet_az2_id" {}
variable "public_security_group_id" {}
variable "private_app_subnet_az1" {}
variable "private_app_subnet_az2" {}
variable "nlb_security_group_id" {}
