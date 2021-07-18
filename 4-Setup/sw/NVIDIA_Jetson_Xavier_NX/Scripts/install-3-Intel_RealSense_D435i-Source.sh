# Installation of Intel RealSense SDK 2.0
# =======================================
# https://github.com/IntelRealSense/librealsense

# Disconnect all Intel RealSense cameras from the computer before running this script

# Build from source
# -----------------

echo "=== Source Installation of Intel RealSense SDK 2.0 ==="

# Install dependencies
sudo apt-get update
sudo apt-get install -y \
     libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev \
     libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev \
     git \
     cmake \
     udev
sudo apt-get autoremove -y

# Download librealsense
# git clone https://github.com/IntelRealSense/librealsense.git
# git pull
# git checkout v2.45.0
sudo mkdir -p /opt/Intel_RealSense_D435i/librealsense
sudo cp -R ../../NVIDIA_Jetson_Xavier_NX/Intel_RealSense_D435i/librealsense /opt/Intel_RealSense_D435i

# Build and install librealsense
cd /opt/Intel_RealSense_D435i/librealsense
sudo mkdir -p build && cd build
sudo cmake ../ -DFORCE_RSUSB_BACKEND=true -DCMAKE_CUDA_COMPILER=/usr/local/cuda/bin/nvcc -DBUILD_WITH_CUDA=true -DCMAKE_BUILD_TYPE=release
sudo make && sudo make install

# Setup udev rule
cd /opt/Intel_RealSense_D435i/librealsense
sudo mkdir -p /etc/udev/rules.d
sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/
#sudo mv /lib/udev/rules.d/60-librealsense2-udev-rules.rules /lib/udev/rules.d/60-librealsense2-udev-rules.rules.old
sudo udevadm control --reload-rules 
sudo udevadm trigger

sudo chmod -R +666 /opt/Intel_RealSense_D435i

# Update Firmware
# $: realsense-viewer
# > Click Intel RealSense D435i More and select Install Recommended Firmware...

# View Imagery
# $: realsense-viewer

