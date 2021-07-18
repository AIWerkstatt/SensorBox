# Installation of FLIR Lepton 3.5 with GroupGets PureThermal 2
# ============================================================

DIR=$PWD

echo "=== Installation of FLIR Lepton 3.5 with GroupGets PureThermal 2 ==="

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
# $: gst-launch-1.0 v4l2src device=/dev/video0 ! videoconvert ! xvimagesink

# v4l-utils
# ---------

echo "--- Installing v4l-utils ---"

sudo apt-get install -y \
     v4l-utils
sudo apt-get autoremove -y

# List all video devices
# $: v4l2-ctl --list-devices

# Query a video device's information
# $: v4l2-ctl -d0 -D

# libuvc (modified by GroupGets)
# ------------------------------

echo "--- Installing libuvc (modified by GroupGets) ---"

# Install dependencies
sudo apt-get update
sudo apt-get install -y \
     libusb-1.0-0-dev \
     libjpeg-dev \  
     git \
     cmake \
     udev
sudo apt-get autoremove -y

# Download libuvc
# git clone https://github.com/groupgets/libuvc.git
# We uncommented the following lines in the CMakeLists.txt:
# find_package(jpeg QUIET)
# if(NOT JPEG_FOUND)
#   find_path(JPEG_INCLUDE_DIR jpeglib.h)
#   if(JPEG_INCLUDE_DIR)
#     set(JPEG_FOUND ON)
#     set(JPEG_LIBRARIES -ljpeg)
#   endif()
# endif()
cd $DIR
sudo mkdir -p /opt/FLIR_Lepton_3.5/libuvc
sudo cp -r ../../NVIDIA_Jetson_Xavier_NX/FLIR_Lepton_3.5/libuvc /opt/FLIR_Lepton_3.5

# Build and install libuvc
cd /opt/FLIR_Lepton_3.5/libuvc
sudo mkdir -p build && cd build
sudo cmake ..
sudo make && sudo make install
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> ~/.bashrc 

# Setup udev rule (to allow everyone access to the camera, without sudo)
# We added a 99-pt2.rules file
# $: lsusb
# Bus 003 Device 006: ID 1e4e:0100 Cubeternet WebCam
# sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"1e4e\", ATTRS{idProduct}==\"0100\", SYMLINK+=\"pt2\", GROUP=\"usb\", MODE=\"0666\"' > /etc/udev/rules.d/99-pt2.rules"
cd /opt/FLIR_Lepton_3.5/libuvc
sudo mkdir -p /etc/udev/rules.d
sudo cp 99-pt2.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules 
sudo udevadm trigger

# Capture Examples
# ----------------

echo "--- Installing capture examples ---"

# Install dependencies
sudo apt-get update
sudo apt-get install -y \
     python-opencv
sudo apt-get autoremove -y

# Download capture examples
# git clone https://github.com/rgoupgets/purethermal1-uvc-capture.git
# We modified python/uvc-radiometry.py to change from Kelvin to Celsius
# def display_temperature(img, val_k, loc, color):
#   val = ktoc(val_k)
#   cv2.putText(img,"{0:.1f} degC".format(val), loc, cv2.FONT_HERSHEY_SIMPLEX, 0.75, color, 2)
cd $DIR
sudo mkdir -p /opt/FLIR_Lepton_3.5/purethermal1-uvc-capture
sudo cp -R ../../NVIDIA_Jetson_Xavier_NX/FLIR_Lepton_3.5/purethermal1-uvc-capture /opt/FLIR_Lepton_3.5

# Print the Lepton's software and hardware version information
# $: /opt/FLIR_Lepton_3.5/purethermal1-uvc-capture/python/uvc-deviceinfo.py
# Run OpenCV example
# $: /opt/FLIR_Lepton_3.5/purethermal1-uvc-capture/python/opencv-capture.py
# Run min/max temperature example
# $: /opt/FLIR_Lepton_3.5/purethermal1-uvc-capture/python/uvc-radiometry.py

# GetThermal
# ----------

echo "--- Installing GetThermal ---"

# Install dependencies
sudo apt-get update
sudo apt-get install -y \
     qt5-default \
     qtmultimedia5-dev \
     qtdeclarative5-dev \
     qml-module-qtquick-controls2 \
     qml-module-qtmultimedia \
     qml-module-qtquick-layouts \
     qml-module-qtquick-window2 \
     qml-module-qtquick-templates2 \
     qml-module-qtgraphicaleffects \
     libusb-1.0-0-dev \
     git \
     cmake
sudo apt-get autoremove -y

# Download GetThermal
# git clone https://github.com/groupgets/GetThermal.git
# cd GetThermal
# git submodule init
# git submodule update
cd $DIR
sudo mkdir -p /opt/FLIR_Lepton_3.5/GetThermal
sudo cp -R ../../NVIDIA_Jetson_Xavier_NX/FLIR_Lepton_3.5/GetThermal /opt/FLIR_Lepton_3.5

# Build libuvc
cd /opt/FLIR_Lepton_3.5/GetThermal/libuvc
sudo mkdir -p build && cd build
sudo cmake ..
sudo make

# Build GetThermal
cd /opt/FLIR_Lepton_3.5/GetThermal
sudo mkdir -p build && cd build
sudo qmake ..
sudo make

# Run GetThermal
# $: /opt/FLIR_Lepton_3.5/GetThermal/build/release/GetThermal

sudo chmod -R +666 /opt/FLIR_Lepton_3.5

