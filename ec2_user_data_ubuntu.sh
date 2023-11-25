#!/bin/bash

echo "Installing AWS CLI"
sudo apt-get update
sudo apt-get install -y awscli

echo "Installing kubectl"
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.26.2/2023-03-17/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

echo "Installing eksctl"
# Download EKS CLI https://github.com/weaveworks/eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version

echo "Installing docker"
sudo apt-get install -y docker.io
sudo usermod -aG docker $USER
newgrp docker
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo systemctl enable docker.service
sudo systemctl start docker.service

echo "Installing Helm"
sudo snap install helm --classic

echo "Installing terraform"
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:hashicorp/stable
sudo apt-get update
sudo apt-get install -y terraform
