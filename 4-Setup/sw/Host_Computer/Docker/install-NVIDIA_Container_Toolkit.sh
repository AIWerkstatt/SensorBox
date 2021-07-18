#!/bin/bash

# Installation of NVIDIA Container Toolkit on Ubuntu 18.04 LTS
# ============================================================
# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit

echo "=== Installation of NVIDIA Container Toolkit on Ubuntu 18.04 LTS ==="

echo "--- Setup the stable package repository and the GPG key ---"
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

echo "--- Install the nvidia-docker2 package (and dependencies) ---"
sudo apt-get update
sudo apt-get install -y nvidia-docker2

echo "--- Restart the Docker daemon ---"
sudo systemctl restart docker


