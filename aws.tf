provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA6H3L55SP7Z76UOXQ"
  secret_key = "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"
}
resource "aws_instance" "testterrafrom" {
     ami = "ami-08e0ca9924195beba"
    instance_type = "t2.micro"
    key_name = "devops" 
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
