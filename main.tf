provider "aws" {
  region = "ap-southeast-1"  # Change to your preferred region
}

resource "aws_key_pair" "zidan_key" {
  key_name   = "zidan-key"
  public_key = file("/home/limin/.ssh/id_rsa.pub")  # Use your actual public key path
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0cc926869cf26c0e3"  # Amazon Linux 2 AMI for ap-southeast-1
  instance_type = "t2.micro"
  key_name      = aws_key_pair.zidan_key.key_name
  security_groups = [aws_security_group.allow_ssh_http.name]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "Zidan-Nginx-Server"
  }
}
