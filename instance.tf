resource "aws_instance" "test-instance" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = "soham-Devops"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = <<EOF
#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo apt install ruby-full -y
sudo apt install wget -y
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto
EOF

  tags = {
    Name = var.Name
  }
}
