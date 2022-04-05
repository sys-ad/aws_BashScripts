#!/bin/bash

# Updates yum packets; updates 
sudo yum update -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/bin --install-dir /usr/bin/aws-cli --update

# version 1.22 mac os
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-17/bin/darwin/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bash_profile

# Install eksctl

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/bin

# --- Provisioning an EKS Cluster using 4 worker nodes.

eksctl create cluster --name dev --version 1.22 --region us-east-1 --nodegroup-name standard-workers --node-type t3.micro --nodes 3 --nodes-min 1 --nodes-max 4 --managed

# --- From here, use Cloud Formation to view events/logs. You may also navigate EKS control plane for a visual abstration. 
# --- The --version option requires a compatible client and server nodes. From 12/15/2021 the Kubectl version is 1.21
# --- The --nodes option creates 3 nodes
# --- use IAM user with AdministrativeAcess IAM Roles
