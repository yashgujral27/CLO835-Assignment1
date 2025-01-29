#!/bin/bash
# Update and install dependencies
sudo yum update -y
sudo amazon-linux-extras enable docker
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker

# Add ec2-user to Docker group
sudo usermod -aG docker ec2-user

# Install AWS CLI
sudo yum install -y aws-cli

# Reboot to apply changes
sudo reboot
