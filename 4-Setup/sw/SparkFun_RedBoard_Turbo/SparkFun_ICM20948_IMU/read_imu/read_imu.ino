/* 
  Read 3-axis linear acceleration in g, 
  3-axis angular rate in degrees per second, 
  3-axis magnetic field in microtesla
  and temperature in degrees Celsius at 1Hz 
  from the SparkFun ICM20948 IMU.

  MIT License
  Copyright (C) 2021 aiWerkstatt(TM)
  www.aiWerkstatt.com
*/

#include <Wire.h>
#include <ICM_20948.h>

ICM_20948_I2C imu;

void setup() 
{
  SerialUSB.begin(115200);
  while(!SerialUSB);

  Wire.begin();
  Wire.setClock(400000);
  delay(500);

  /* Connect to SparkFun ICM20948 IMU */
  bool initialized = false;
  while( !initialized )
  {
    imu.begin();
    
    SerialUSB.print(F("Initialization of the IMU returned: "));
    SerialUSB.println(imu.statusString());
    if (imu.status != ICM_20948_Stat_Ok)
    {
      SerialUSB.println("Trying again...");
      delay(500);
    }
    else
    {
      initialized = true;
    }
  }
  
  SerialUSB.println("SparkFun ICM20948 IMU");
  delay(100);
}

void loop() 
{
  if (imu.dataReady())
  {
    imu.getAGMT();

    SerialUSB.print("Linear Acceleration [mg]: ");
    SerialUSB.print(imu.accX());
    SerialUSB.print("/");
    SerialUSB.print(imu.accY());
    SerialUSB.print("/");
    SerialUSB.print(imu.accZ());
    SerialUSB.print(", Angular Rate [dps]: ");
    SerialUSB.print(imu.gyrX());
    SerialUSB.print("/");
    SerialUSB.print(imu.gyrY());
    SerialUSB.print("/");
    SerialUSB.print(imu.gyrZ());
    SerialUSB.print(", Magnetic Field [uT]: ");
    SerialUSB.print(imu.magX());
    SerialUSB.print("/");
    SerialUSB.print(imu.magY());
    SerialUSB.print("/");
    SerialUSB.print(imu.magZ());
    SerialUSB.print(", Temperature [C]: ");
    SerialUSB.print(imu.temp());
    SerialUSB.println();    
    delay(1000);
  }
  else
  {
    SerialUSB.println("Waiting for data");
    delay(500);
  }
}
