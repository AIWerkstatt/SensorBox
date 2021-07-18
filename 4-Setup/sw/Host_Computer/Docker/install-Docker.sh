#!/bin/bash

# Installation of Docker on Ubuntu 18.04 LTS
# ==========================================
# https://www.docker.com/

echo "=== Installation of Docker on Ubuntu 18.04 LTS ==="

# Create a Docker identification
# https://hub.docker.com/signup

# Uninstall
# $: sudo apt-get remove -y docker-ce docker-ce-cli containerd.io

echo "--- Installing HTTPS packages ---"
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

echo "--- Add Docker’s offical GPG key ---"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# check fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
# $: sudo apt-key fingerprint 0EBFCD88

echo "--- Add Docker's stable repository ---"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "--- Install latest version of Docker CE (Community Edition) ---"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo "--- Version ---"
sudo docker --version

echo "--- Test ---"
sudo docker run --rm hello-world

# Add user name to the docker group to be able to run docker without sudo
sudo usermod -aG docker $USER

