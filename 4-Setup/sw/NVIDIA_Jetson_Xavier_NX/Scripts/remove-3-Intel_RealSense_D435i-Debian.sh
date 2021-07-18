# Remove Intel RealSense SDK 2.0
# ==============================
# https://github.com/IntelRealSense/librealsense

# Debian package
# --------------

sudo add-apt-repository --remove "deb https://librealsense.intel.com/Debian/apt-repo bionic main"

dpkg -l | grep "realsense" | cut -d " " -f 3 | xargs sudo dpkg --purge







