#!/bin/bash
# Install Docker
sudo apt update
sudo apt install -y docker.io
sudo usermod -aG docker $USER

# Install K3D
echo "========== INSTALL K3D ==========="
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

Create a K3D cluster
# sudo k3d cluster create mycluster
sudo k3d cluster create mycluster --port "30001:30001@server:0"


echo "========== INSTALL kubectl ==========="
# Install kubectl if necessary
sudo apt update
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/


# Install Argo CD
echo "========== INSTALL argocd ==========="
sudo kubectl create namespace argocd
sudo kubectl create namespace dev
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "########### Installation complete. Use 'kubectl port-forward svc/argocd-server -n argocd 8080:443' to access the Argo CD UI. ############"

echo "########### to get the password use: kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="'{.data.password}'" | base64 --decode ###########"