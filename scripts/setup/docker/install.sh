#!/bin/bash -x

print_info "Starting Docker Installation..."

# install deps
apt update
apt install apt-transport-https ca-certificates curl gnupg lsb-release

print_info "Deps installed ... installing docker"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io

print_info "Docker installed successfully ... doing post install steps"

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

print_info "Installation Done ... Testing installation"

docker run hello-world

check_status

print_info "Installing Docker Compose"

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

print_info "Installation Done ... Testing installation"

docker-compose --version

check_status
