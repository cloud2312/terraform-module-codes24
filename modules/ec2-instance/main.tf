# launch the ec2 instance and install website
resource "aws_instance" "public_ec2_instance_az1" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.ec2-instance_type
  subnet_id              = var.public_subnet_az1_id
  vpc_security_group_ids = [var.public_security_group_id]
  key_name               = "mytest"
  user_data              = file("V:/Test-module-terraform/modules/ec2-instance/script/init.sh")

  tags = {
    Name = "public-ec2-instance_az1"
  }
}

# launch the ec2 instance and install website
resource "aws_instance" "public_ec2_instance_az2" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.ec2-instance_type
  subnet_id              = var.public_subnet_az2_id
  vpc_security_group_ids = [var.public_security_group_id]
  key_name               = "mytest"
  user_data              = file("V:/Test-module-terraform/modules/ec2-instance/script/init.sh")

  tags = {
    Name = "public-ec2-instance-az2"
  }
}

###########################################################################

# launch the two ec2 instance in private subnet
resource "aws_instance" "private_ec2_instance_az1" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.ec2-instance_type
  subnet_id              = var.private_app_subnet_az1
  vpc_security_group_ids = [var.nlb_security_group_id]
  key_name               = "mytest"
  user_data              = file("V:/Test-module-terraform/modules/ec2-instance/script/init.sh")

  tags = {
    Name = "private-ec2-instance-az1"
  }
}

resource "aws_instance" "private_ec2_instance_az2" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.ec2-instance_type
  subnet_id              = var.private_app_subnet_az2
  vpc_security_group_ids = [var.nlb_security_group_id]
  key_name               = "mytest"
  user_data              = file("V:/Test-module-terraform/modules/ec2-instance/script/init.sh")

  tags = {
    Name = "private-ec2-instance-az2"
  }
}
