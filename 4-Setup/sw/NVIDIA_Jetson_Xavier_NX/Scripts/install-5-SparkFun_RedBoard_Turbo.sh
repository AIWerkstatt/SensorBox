# Installation of SparkFun RedBoard Turbo
# =======================================

# Enter "host" as parameter for installation on the host computer, 
# default installation with no parameters: NVIDIA Jetson Xavier NX

DIR=$PWD

echo "=== Installation of SparkFun RedBoard Turbo ==="

# Arduino IDE
# ===========
# Manual Page: https://github.com/arduino/Arduino/blob/master/build/shared/manpage.adoc

echo "--- Installing Arduino IDE ---"

sudo apt-get update
sudo apt-get install -y \
     libcanberra-gtk0 libcanberra-gtk-module libgtk-3-dev
sudo apt-get autoremove -y

sudo mkdir -p /opt/SparkFun_RedBoard_Turbo
sudo chmod 777 /opt/SparkFun_RedBoard_Turbo

# We created a portable version
# mkdir sw/SparkFun_RedBoard_Turbo/ArduinoIDE/arduino-1.8.13-linux64/arduino-1.8.13 /portable
# mkdir sw/SparkFun_RedBoard_Turbo/ArduinoIDE/arduino-1.8.13-linuxaarch64/arduino-1.8.13 /portable

if [ $1 == "host" ]; then
  sudo cp -r ../../SparkFun_RedBoard_Turbo/ArduinoIDE/arduino-1.8.13-linux64/arduino-1.8.13 /opt/SparkFun_RedBoard_Turbo/arduino-1.8.13
else
  sudo cp -r ../../SparkFun_RedBoard_Turbo/ArduinoIDE/arduino-1.8.13-linuxaarch64/arduino-1.8.13 /opt/SparkFun_RedBoard_Turbo/arduino-1.8.13
fi

cd /opt/SparkFun_RedBoard_Turbo/arduino-1.8.13
sudo bash install.sh
bash arduino-linux-setup.sh $USER

sudo mkdir -p /opt/SparkFun_RedBoard_Turbo/Arduino
sudo arduino --pref sketchbook.path=/opt/SparkFun_RedBoard_Turbo/Arduino --save-prefs

# Arduino SAMD Board Add-Ons
# --------------------------
# Installed at /opt/SparkFun_RedBoard_Turbo/arduino-1.8.13/portable/packages/arduino/hardware/samd/1.8.11

echo "--- Installing Arduino SAMD Board Add-Ons ---"

sudo arduino --install-boards arduino:samd:1.8.11

# SparkFun SAMD Board Add-Ons
# ---------------------------
# Installed at /opt/SparkFun_RedBoard_Turbo/arduino-1.8.13/portable/packages/SparkFun/hardware/samd/1.8.3

# We modified the SparkFun SAMD Boards package_sparkfun_index.json file 
# to use versions of arm-none-eabi-gcc and BOSSAC that are compiled for ARM 64
# and use an already downloaded copy of the sparkfun-samd-1.8.3 package:
# "name": "SparkFun SAMD Boards  (dependency: Arduino SAMD Boards 1.8.1) modified with ARM64 support by aiWerkstatt",
# "version": "1.8.3", 
# "url": "file:///opt/SparkFun_RedBoard_Turbo/SparkFun_SAMD_Boards/sparkfun-samd-1.8.3.tar.bz2",
# "boards": [
#    { "name": "Sparkfun RedBoard Turbo" },...
#  ],
#  "toolsDependencies": [
#    {
#      "packager": "arduino",
#      "name": "arm-none-eabi-gcc",
#      "version": "7-2017q4"
#    },
#    {
#      "packager": "arduino",
#      "name": "bossac",
#      "version": "1.7.0-arduino3"
#    },
#    {
#      "packager": "arduino",
#      "name": "openocd",
#      "version": "0.10.0-arduino7"
#    }

echo "--- Installing SparkFun SAMD Board Add-Ons ---"

cd $DIR
sudo mkdir -p /opt/SparkFun_RedBoard_Turbo/SparkFun_SAMD_Boards
sudo cp ../../SparkFun_RedBoard_Turbo/SparkFun_SAMD_Boards/package_sparkfun_index.json /opt/SparkFun_RedBoard_Turbo/SparkFun_SAMD_Boards/package_sparkfun_index.json
sudo cp ../../SparkFun_RedBoard_Turbo/SparkFun_SAMD_Boards/sparkfun-samd-1.8.3.tar.bz2 /opt/SparkFun_RedBoard_Turbo/SparkFun_SAMD_Boards/sparkfun-samd-1.8.3.tar.bz2

sudo arduino --pref boardsmanager.additional.urls=file:///opt/SparkFun_RedBoard_Turbo/SparkFun_SAMD_Boards/package_sparkfun_index.json --save-prefs

sudo arduino --install-boards SparkFun:samd:1.8.3

sudo arduino --board SparkFun:samd:RedBoard_Turbo --port /dev/ttyACM0 --save-prefs

# Scan for I2C Addresses

echo "--- Installing Scan for I2C Addresses ---"

cd $DIR
sudo cp -r ../../SparkFun_RedBoard_Turbo/SparkFun_SAMD_Boards/scan_i2c_addresses /opt/SparkFun_RedBoard_Turbo/Arduino
# $: arduino --upload /opt/SparkFun_RedBoard_Turbo/Arduino/scan_i2c_addresses/scan_i2c_addresses.ino

sudo usermod -a -G dialout $USER
sudo chmod -R +666 /opt/SparkFun_RedBoard_Turbo

