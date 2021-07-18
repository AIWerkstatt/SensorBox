/*  
  Read 3-axis linear acceleration in g, 
  3-axis angular rate in degrees per second and 
  3-axis magnetic field in gauss at 1 Hz
  from the SparkFun LSM9DS1 IMU.
  
  MIT License
  Copyright (C) 2021 aiWerkstatt(TM)
  www.aiWerkstatt.com
*/

#include <Wire.h>
#include <SparkFunLSM9DS1.h>

LSM9DS1 imu_camera_right;

void setup()
{
  SerialUSB.begin(115200);
  while(!SerialUSB);
  
  Wire.begin();  
  Wire.setClock(400000);
  delay(500);
  
  /* Connect to SparkFun LSM9DS1 IMU */
  /* default addresses: 0x6B, 0x1E for left camera
     alternative addresses: 0x6A, 0x1C for right camera */
  if (!imu_camera_right.begin(0x6A, 0x1C))
  {
    SerialUSB.println("Can not connect to SparkFun LSM9DS1 IMU");
    while(1);
  }
  
  SerialUSB.println("SparkFun LSM9DS1 IMU");
  delay(100);
}

void loop()
{
  if ( imu_camera_right.gyroAvailable() )
  {
    imu_camera_right.readGyro();
  }
  if ( imu_camera_right.accelAvailable() )
  {
    imu_camera_right.readAccel();
  }
  if ( imu_camera_right.magAvailable() )
  {
    imu_camera_right.readMag();
  }
  
  SerialUSB.print("Linear Acceleration [g]: ");
  SerialUSB.print(imu_camera_right.calcAccel(imu_camera_right.ax), 2);
  SerialUSB.print("/");
  SerialUSB.print(imu_camera_right.calcAccel(imu_camera_right.ay), 2);
  SerialUSB.print("/");
  SerialUSB.print(imu_camera_right.calcAccel(imu_camera_right.az), 2);
  SerialUSB.print(", Angular Rate [dps]: ");
  SerialUSB.print(imu_camera_right.calcGyro(imu_camera_right.gx), 2);
  SerialUSB.print("/");
  SerialUSB.print(imu_camera_right.calcGyro(imu_camera_right.gy), 2);
  SerialUSB.print("/");
  SerialUSB.print(imu_camera_right.calcGyro(imu_camera_right.gz), 2);
  SerialUSB.print(", Magnetic Field [gauss]: ");
  SerialUSB.print(imu_camera_right.calcMag(imu_camera_right.mx), 2);
  SerialUSB.print("/");
  SerialUSB.print(imu_camera_right.calcMag(imu_camera_right.my), 2);
  SerialUSB.print("/");
  SerialUSB.print(imu_camera_right.calcMag(imu_camera_right.mz), 2);
  SerialUSB.println();
  
  delay(1000);
}
