terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami                         = "ami-0e731c8a588258d0d"
  instance_type               = "t2.nano"
  key_name                    = "scalable-app"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.allow_ssh.name]  
  tags = {
    Name = "Scalable App"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y git

              # Install nvm
              export NVM_DIR="$HOME/.nvm"
              [ -s "$NVM_DIR/nvm.sh" ] || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

              # Source nvm script and install Node.js
              export NVM_DIR="$HOME/.nvm"
              [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

              # Install Node.js
              nvm install 20.11.0

              # Set default Node.js version
              nvm alias default 20.11.0
              EOF
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH from anywhere. For better security, restrict this to specific IPs.
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows HTTP from anywhere
  }  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allows all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}