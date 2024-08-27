#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y
sudo yum install httpd -y
sudo systemctl start nginx
sudo systemctl start httpd
sudo systemctl enable nginx
sudo systemctl enable httpd
echo " this is my testing server " > /var/www/html