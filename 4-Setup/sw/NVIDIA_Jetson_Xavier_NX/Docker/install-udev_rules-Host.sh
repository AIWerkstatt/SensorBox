#!/bin/bash

# Setup udev rules on Host
# ------------------------

sudo mkdir -p /etc/udev/rules.d

# Intel RealSense D435i
sudo cp ../../NVIDIA_Jetson_Xavier_NX/Intel_RealSense_D435i/librealsense/config/99-realsense-libusb.rules /etc/udev/rules.d/

# FLIR Lepton 3.5
sudo cp ../../NVIDIA_Jetson_Xavier_NX/FLIR_Lepton_3.5/libuvc/99-pt2.rules /etc/udev/rules.d/

sudo udevadm control --reload-rules 
sudo udevadm trigger
