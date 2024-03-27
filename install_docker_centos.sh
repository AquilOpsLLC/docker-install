#!/bin/bash

# Update the system
sudo yum update -y

# Install required dependencies
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Set up the Docker repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker CE
sudo yum install -y docker-ce docker-ce-cli containerd.io

# Start Docker
sudo systemctl start docker

# Enable Docker to start on boot
sudo systemctl enable docker

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Optionally, you may want to add your user to the docker group to run Docker commands without sudo.
# Be cautious with this as it grants the user root privileges on the system.
# sudo usermod -aG docker $USER

# Verify Docker installation
docker --version

# Verify Docker Compose installation
docker-compose --version
