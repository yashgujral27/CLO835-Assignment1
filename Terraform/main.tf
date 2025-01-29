provider "aws" {
  region = "us-east-1"
}

# Amazon ECR Repository for Web App
resource "aws_ecr_repository" "webapp" {
  name = "webapp-repo"
}

# Amazon ECR Repository for MySQL
resource "aws_ecr_repository" "mysql" {
  name = "mysql-repo"
}

# Security Group for EC2 instance
resource "aws_security_group" "web_sg" {
  name        = "web_security_group"
  description = "Allow HTTP, SSH, and app ports"

  # Allow SSH (Port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow traffic for the web application
  ingress {
    from_port   = 8081
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance to host the application
resource "aws_instance" "webserver" {
  ami                    = "ami-032ae1bccc5be78ca"
  instance_type          = "t2.micro"
  key_name               = "projectKey"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data              = file("${path.module}/userData.sh")

  tags = {
    Name = "DockerServer"
  }
}

#EC2 Public IP
output "ec2_public_ip" {
  value = aws_instance.webserver.public_ip
}

# Output ECR repository URLs
output "webapp_repo_url" {
  value = aws_ecr_repository.webapp.repository_url
}

output "mysql_repo_url" {
  value = aws_ecr_repository.mysql.repository_url
}
