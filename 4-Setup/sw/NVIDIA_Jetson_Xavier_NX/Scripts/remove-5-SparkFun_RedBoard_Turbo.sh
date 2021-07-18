# Remove SparkFun RedBoard Turbo
# ==============================

sudo rm -rf  /opt/SparkFun_RedBoard_Turbo/Arduino/scan_i2c_addresses

cd /opt/SparkFun_RedBoard_Turbo/arduino-1.8.13
sudo ./uninstall.sh

sudo rm -rf /opt/SparkFun_RedBoard_Turbo

