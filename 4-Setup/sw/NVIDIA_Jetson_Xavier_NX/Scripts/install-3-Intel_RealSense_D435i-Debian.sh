# Installation of Intel RealSense SDK 2.0
# =======================================
# https://github.com/IntelRealSense/librealsense

# Disconnect all Intel RealSense cameras from the computer before running this script

# Debian package
# --------------

echo "=== Debian Installation of Intel RealSense SDK 2.0 ==="

# Register the server's public key
sudo apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE

# Add the server to the list of repositories
sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo bionic main" -u

# Install Intel RealSense libraries
sudo apt-get update
sudo apt-get install -y \
     librealsense2-utils \
     librealsense2-dev \
     librealsense2-dbg
sudo apt-get autoremove -y

# Update Firmware
# $: realsense-viewer
# > Click Intel RealSense D435i More and select Install Recommended Firmware...

# View Imagery
# $: realsense-viewer

