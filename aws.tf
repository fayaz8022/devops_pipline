provider "aws" {
  region = "ap-south-1"
}
#Creating security groups and allow ssh, http and custom icmp
resource "aws_security_group" "terraform_sg" {
name = "terraform_sg"
description = "allow ssh, http and cutom icmp traffic"
ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = 8080
to_port = 8080
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}
resource "aws_instance" "testterrafrom" {
     ami = "ami-08e0ca9924195beba"
  instance_type = "t2.micro"
   user_data = <<-EOF
             #!/bin/bash
             yum install java -y
             yum install wget -y
             cd /opt/
             wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.43/bin/apache-tomcat-9.0.43.tar.gz
             tar -xvf apache-tomcat-9.0.43.tar.gz
             ./apache-tomcat-9.0.43/bin/catalina.sh run
             yum install git -y
             git clone https://github.com/fayaz8022/devopsdemo.git
             EOF
  tags = {
    Name = "tomcat_container"
  }
}
