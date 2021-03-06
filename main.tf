terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "ap-south-22"
}
resource "aws_s3_bucket" "b" {
  bucket = "mywarfile"
  acl    = "private"

  tags = {
    Name        = "mywarfile"
    Environment = "Dev"
  }
}
resource "aws_instance" "testterrafrom" {
  ami           = "ami-08e0ca9924195beba"
  instance_type = "t2.micro"
  key_name      = "devops"
  user_data     = <<-EOF
             #!/bin/bash
             yum install java -y
             yum install wget -y
             cd /opt/
             wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.43/bin/apache-tomcat-9.0.43.tar.gz
             tar -xvf apache-tomcat-9.0.43.tar.gz
             ./apache-tomcat-9.0.43/bin/catalina.sh run
             EOF
}
