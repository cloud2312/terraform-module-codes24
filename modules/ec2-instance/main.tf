# launch the ec2 instance and install website
resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.amazon_linux_2.id
  count                  = 3
  instance_type          = var.ec2-instance_type
  subnet_id              = var.public_subnet_az1_id
  vpc_security_group_ids = [var.public_security_group_id]
  key_name               = "mytest"
  user_data              = ""

  tags = {
    Name = "public ec2 instance"
  }
}


