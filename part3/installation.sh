#!/bin/bash
# Install Docker
sudo apt update
sudo apt install -y docker.io
sudo usermod -aG docker $USER

# Install K3D
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Create a K3D cluster
k3d cluster create mycluster

# Install kubectl if necessary
sudo apt install -y kubectl

# Install Argo CD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "Installation complete. Use 'kubectl port-forward svc/argocd-server -n argocd 8080:443' to access the Argo CD UI."
