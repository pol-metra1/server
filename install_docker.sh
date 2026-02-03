#!/bin/bash
apt update
apt -y upgrade
apt -y install wget
apt -y install curl
apt -y install gpg
apt -y install software-properties-common
apt -y install ca-certificates
apt -y install apt-transport-https
apt -y install maven
wget -O- https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor | sudo tee /etc/apt/keyrings/docker.gpg > /dev/null
VER=$(lsb_release -sc)
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $VER stable"| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt -y install docker-ce
apt -y install docker-compose
cd /opt
mkdir twportainer
cd twportainer
touch docker-compose.yml
echo 'services:
  twportainer:
    image: portainer/portainer-ce:latest
    container_name: twportainer
    environment:
      - TZ=Europe/Moscow
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /opt/twportainer/portainer_data:/data
    ports:
      - "8000:8000"
      - "9443:9443"
    restart: always' >> docker-compose.yml
docker compose up -d
cd ~
curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
apt update
apt -y install helm
