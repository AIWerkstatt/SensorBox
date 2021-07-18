/*
  Read the absolute pressure in hectopascal and the temperture in degrees Celsius at 1Hz 
  from the SparkFun LPS25HB Pressure Sensor.

  MIT License
  Copyright (C) 2021 aiWerkstatt(TM)
  www.aiWerkstatt.com
*/

#include <Wire.h>
#include <SparkFun_LPS25HB_Arduino_Library.h>

LPS25HB pressure_sensor;

void setup()
{
  SerialUSB.begin(115200);
  while (!SerialUSB);
  
  Wire.begin();
  Wire.setClock(400000);
  delay(500);
  
  /* Connect to SparkFun LPS25HB Pressure Sensor */
  pressure_sensor.begin();
  if (pressure_sensor.isConnected() == false)
  {
    SerialUSB.println("Can not connect to SparkFun LPS25HB Pressure Sensor");
    while (1);
  }
  
  SerialUSB.println("SparkFun LPS25HB Pressure Sensor");
  delay(100);
}

void loop()
{
  float pressure = 0.0;
  float temperature = 0.0;
  
  /* Read absolute pressure in hectopascal */
  pressure = pressure_sensor.getPressure_hPa();
  
  /* Read temperature in degrees Celsius */
  temperature = pressure_sensor.getTemperature_degC();
  
  /* Print pressure and temperature */
  SerialUSB.print("Pressure [hPa]: ");
  SerialUSB.print(pressure);
  SerialUSB.print(", Temperature [C]: ");
  SerialUSB.println(temperature);

  delay(1000); /* Wait 1000ms = 1Hz with up to 40ms for the max rate of 25Hz */
}
