#!/bin/bash

echo "Installing AWS CLI"
sudo apt-get update
sudo apt-get install -y awscli

echo "Installing kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

echo "Installing eksctl"
# Download EKS CLI https://github.com/weaveworks/eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version


echo "Installing Helm"
HELM_VERSION="v3.8.0"

# Download Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# Make the script executable
chmod +x get_helm.sh
# Install Helm with the specific version
./get_helm.sh --version $HELM_VERSION
# Clean up the downloaded script
rm get_helm.sh


echo "Installing terraform"
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:hashicorp/stable
sudo apt-get update
sudo apt-get install -y terraform
