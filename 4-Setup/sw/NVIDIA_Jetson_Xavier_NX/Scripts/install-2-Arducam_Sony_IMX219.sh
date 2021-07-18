# Installations for Arducam Sony IMX219 Camera Modules
# ====================================================

DIR=$PWD

echo "=== Installations for Arducam Sony IMX219 Camera Modules ==="

# gstreamer
# ---------

echo "--- Installing gstreamer ---"

sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo apt-get update
sudo apt-get install -y \
     gstreamer1.0-tools \
     gstreamer1.0-alsa \
     gstreamer1.0-plugins-base \
     gstreamer1.0-plugins-good \
     gstreamer1.0-plugins-bad \
     gstreamer1.0-plugins-ugly \
     gstreamer1.0-libav \
     libgstreamer1.0-dev \
     libgstreamer-plugins-base1.0-dev \
     libgstreamer-plugins-good1.0-dev \
     libgstreamer-plugins-bad1.0-dev
sudo apt-get autoremove -y

# View Imagery
# gst-launch-1.0 nvarguscamerasrc sensor-id=0 ! 'video/x-raw(memory:NVMM),width=3264, height=2464, framerate=21/1, format=NV12' ! nvvidconv flip-method=0 ! 'video/x-raw, width=816, height=616' ! nvvidconv ! nvegltransform ! nveglglessink -e
# gst-launch-1.0 nvarguscamerasrc sensor-id=1 ! 'video/x-raw(memory:NVMM),width=3264, height=2464, framerate=21/1, format=NV12' ! nvvidconv flip-method=0 ! 'video/x-raw, width=816, height=616' ! nvvidconv ! nvegltransform ! nveglglessink -e

# v4l-utils
# ---------

echo "--- Installing v4l-utils ---"

sudo apt-get install -y \
     v4l-utils
sudo apt-get autoremove -y

# List all video devices
# v4l2-ctl --list-devices

# Query a video device's information
# v4l2-ctl -d0 -D

