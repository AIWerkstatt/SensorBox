# Installation of the Sensor Suite
# ================================

DIR=$PWD

echo "=== Installation of the Sensor Suite ==="

# SparkFun Temperature Sensor
# ---------------------------

echo "--- Installing SparkFun Temperature Sensor ---"

# Install SparkFun TMP102 Breakout Library
# https://github.com/sparkfun/SparkFun_TMP102_Arduino_Library
# sudo arduino --install-library "SparkFun TMP102 Breakout":1.1.0
# We use an already downloaded copy of the SparkFun TMP102 Breakout Library
sudo unzip ../../SparkFun_RedBoard_Turbo/SparkFun_TMP102_Temperature_Sensor/SparkFun_TMP102_Arduino_Library-master.zip -d /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/
sudo mv /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/SparkFun_TMP102_Arduino_Library-master /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/SparkFun_TMP102_Breakout

# Read Temperature
sudo cp -r ../../SparkFun_RedBoard_Turbo/SparkFun_TMP102_Temperature_Sensor/read_temperature /opt/SparkFun_RedBoard_Turbo/Arduino
# $: arduino --upload /opt/SparkFun_RedBoard_Turbo/Arduino/read_temperature/read_temperature.ino


# SparkFun ICM20948 IMU
# ---------------------

echo "--- Installing SparkFun ICM20948 IMU ---"

# Install SparkFun ICM20948 Library
# https://github.com/sparkfun/SparkFun_ICM-20948_ArduinoLibrary
# sudo arduino --install-library "SparkFun 9DoF IMU Breakout - ICM 20948 - Arduino Library":1.2.5
# We use an already downloaded copy of the SparkFun ICM20948 Library
sudo unzip ../../SparkFun_RedBoard_Turbo/SparkFun_ICM20948_IMU/SparkFun_ICM-20948_ArduinoLibrary-master.zip -d /opt/SparkFun_RedBoard_Turbo/Arduino/libraries
sudo mv /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/SparkFun_ICM-20948_ArduinoLibrary-master /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/SparkFun_9DoF_IMU_Breakout_-_ICM_20948_-_Arduino_Library

# Read IMU
sudo cp -r ../../SparkFun_RedBoard_Turbo/SparkFun_ICM20948_IMU/read_imu /opt/SparkFun_RedBoard_Turbo/Arduino
# $: arduino --upload /opt/SparkFun_RedBoard_Turbo/Arduino/read_imu/read_imu.ino


# SparkFun LSM9DS1 IMU
# --------------------

echo "--- Installing SparkFun LSM9DS1 IMU ---"

# Install SparkFun LSM9DS1 Library
# https://github.com/sparkfun/SparkFun_LSM9DS1_Arduino_Library
# sudo arduino --install-library "SparkFun LSM9DS1 IMU":2.0.0
# We use an already downloaded copy of the SparkFun LSM9DS1 Library
sudo unzip ../../SparkFun_RedBoard_Turbo/SparkFun_LSM9DS1_IMU/SparkFun_LSM9DS1_Arduino_Library-master.zip -d /opt/SparkFun_RedBoard_Turbo/Arduino/libraries
sudo mv /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/SparkFun_LSM9DS1_Arduino_Library-master /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/SparkFun_LSM9DS1_IMU

# Read IMU
sudo cp -r ../../SparkFun_RedBoard_Turbo/SparkFun_LSM9DS1_IMU/read_imu_camera /opt/SparkFun_RedBoard_Turbo/Arduino
# $: arduino --upload /opt/SparkFun_RedBoard_Turbo/Arduino/read_imu_camera/read_imu_camera.ino


# SparkFun LPS25HB Pressure Sensor
# --------------------------------

echo "--- Installing SparkFun LPS25HB Pressure Sensor ---"

# Install SparkFun LPS25HB Library
# https://github.com/sparkfun/SparkFun_LPS25HB_Arduino_Library
# sudo arduino --install-library "SparkFun LPS25HB Pressure Sensor Library":1.1.0
# We use an already downloaded copy of the SparkFun LPS25HB Library
sudo unzip ../../SparkFun_RedBoard_Turbo/SparkFun_LPS25HB_Pressure_Sensor/SparkFun_LPS25HB_Arduino_Library-master.zip -d /opt/SparkFun_RedBoard_Turbo/Arduino/libraries
sudo mv /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/SparkFun_LPS25HB_Arduino_Library-master /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/SparkFun_LPS25HB_Pressure_Sensor_Library

# Read Pressure
sudo cp -r ../../SparkFun_RedBoard_Turbo/SparkFun_LPS25HB_Pressure_Sensor/read_pressure /opt/SparkFun_RedBoard_Turbo/Arduino
# $: arduino --upload /opt/SparkFun_RedBoard_Turbo/Arduino/read_pressure/read_pressure.ino


# SparkFun NEO-M9N GPS
# --------------------

echo "--- Installing SparkFun NEO-M9N GPS ---"

# Install SparkFun u-blox GNSS Arduino Library
# https://github.com/sparkfun/SparkFun_u-blox_GNSS_Arduino_Library
# sudo arduino --install-library "SparkFun u-blox GNSS Arduino Library":2.0.7
# We use an already downloaded copy of the SparkFun u-blox GNSS Arduino Library
sudo unzip ../../SparkFun_RedBoard_Turbo/SparkFun_NEO-M9N_GPS/SparkFun_u-blox_GNSS_Arduino_Library-master.zip -d /opt/SparkFun_RedBoard_Turbo/Arduino/libraries
sudo mv /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/SparkFun_u-blox_GNSS_Arduino_Library-master /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/SparkFun_u-blox_GNSS_Arduino_Library

# Read GNSS
sudo cp -r ../../SparkFun_RedBoard_Turbo/SparkFun_NEO-M9N_GPS/read_gnss /opt/SparkFun_RedBoard_Turbo/Arduino
# $: arduino --upload /opt/SparkFun_RedBoard_Turbo/Arduino/read_gnss/read_gnss.ino


# Zio INA219 Current and Voltage Sensor
# -------------------------------------

echo "--- Installing Zio INA219 Current and Voltage Sensor ---"

# Install Adafruit’s INA219 Library
# https://github.com/adafruit/Adafruit_INA219
# sudo arduino --install-library "Adafruit INA219":1.1.0
# We use an already downloaded copy of the Adafruit INA219 Library
sudo unzip ../../SparkFun_RedBoard_Turbo/Zio_INA219_Current_and_Voltage_Sensor/Adafruit_INA219-master.zip -d /opt/SparkFun_RedBoard_Turbo/Arduino/libraries
sudo mv /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/Adafruit_INA219-master /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/Adafruit_INA219

# Install Adafruit’s BUS IO Library
# https://github.com/adafruit/Adafruit_BusIO
# sudo arduino --install-library "Adafruit BusIO":1.7.3
# We use an already downloaded copy of the Adafruit BUS IO Library
sudo unzip ../../SparkFun_RedBoard_Turbo/Zio_INA219_Current_and_Voltage_Sensor/Adafruit_BusIO-master.zip -d /opt/SparkFun_RedBoard_Turbo/Arduino/libraries
sudo mv /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/Adafruit_BusIO-master /opt/SparkFun_RedBoard_Turbo/Arduino/libraries/Adafruit_BusIO

# Read Power
sudo cp -r ../../SparkFun_RedBoard_Turbo/Zio_INA219_Current_and_Voltage_Sensor/read_power /opt/SparkFun_RedBoard_Turbo/Arduino
# $: arduino --upload /opt/SparkFun_RedBoard_Turbo/Arduino/read_power/read_power.ino


# MaxBotix HRLV-MaxSonar-EZ4 Ultrasonic Range Finder
# --------------------------------------------------

echo "--- Installing MaxBotix HRLV-MaxSonar-EZ4 Ultrasonic Range Finder ---"

# Read Range
sudo cp -r ../../SparkFun_RedBoard_Turbo/MaxBotix_HRLV-MaxSonar-EZ4_Ultrasonic_Range_Finder/read_range /opt/SparkFun_RedBoard_Turbo/Arduino
# $: arduino --upload /opt/SparkFun_RedBoard_Turbo/Arduino/read_range/read_range.ino

sudo chmod -R +666 /opt/SparkFun_RedBoard_Turbo






















