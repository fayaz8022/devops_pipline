provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "testterrafrom" {
      ami = "ami-08e0ca9924195beba"
      instance_type = "t2.micro"
user_data = <<-EOF
              #!/bin/bash
              sudo su
              yum update -y
              yum install httpd -y
               echo "Hello, World" > /var/www/html/index.html
              systemctl start httpd
              EOF
  tags = {
    Name = "tomcat_container"
  }
}

