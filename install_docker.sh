#!/bin/bash

# Update the apt package index and install packages to allow apt to use a repository over HTTPS
sudo apt update
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify that you now have the key with the fingerprint
sudo apt-key fingerprint 0EBFCD88

# Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package index again, and install the latest version of Docker Engine and containerd
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Docker should now be installed, the daemon started, and the process enabled to start on boot. Let's check its status.
sudo systemctl status docker

# Optionally, you may want to add your user to the docker group to run Docker commands without sudo. 
# Be cautious with this as it grants the user root privileges on the system.
# sudo usermod -aG docker $USER

# Verify Docker installation
docker --version

# Verify Docker Compose installation
docker-compose --version