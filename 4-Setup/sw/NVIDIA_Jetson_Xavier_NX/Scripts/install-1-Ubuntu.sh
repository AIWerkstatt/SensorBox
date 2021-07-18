# Basic Installations on Ubuntu 18.04 LTS
# =======================================

echo "=== Basic Installations on Ubuntu 18.04 LTS ==="

echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc 
echo 'export LANG=en_US.UTF-8' >> ~/.bashrc 
echo 'export LANGUAGE=en_US.UTF-8' >> ~/.bashrc 

echo 'export CUDACXX=/usr/local/cuda/bin/nvcc' >> ~/.bashrc 
echo 'export PATH=$PATH:/usr/local/cuda/bin' >> ~/.bashrc 
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64' >> ~/.bashrc 

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install --no-install-recommends -y \
     apt-utils \
     libglu1-mesa-dev freeglut3-dev mesa-common-dev mesa-utils \
     gnupg2 \
     software-properties-common \
     nano \
     git \
     build-essential \
     cmake \
     python3-pip
sudo apt-get autoremove -y

