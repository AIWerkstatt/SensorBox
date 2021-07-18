# Remove Intel RealSense SDK 2.0
# ==============================
# https://github.com/IntelRealSense/librealsense

# Build from source
# -----------------

# Uninstall librealsense
cd /opt/Intel_RealSense_D435i/librealsense/build
sudo make uninstall

# Delete librealsense
sudo rm -rf /opt/Intel_RealSense_D435i

# Delete udev rule
sudo rm /etc/udev/rules.d/99-realsense-libusb.rules
sudo udevadm control --reload-rules && udevadm trigger








