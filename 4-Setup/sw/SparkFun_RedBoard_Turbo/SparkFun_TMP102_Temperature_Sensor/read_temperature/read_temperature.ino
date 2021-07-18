/*
  Read the temperture in Celsius at 1Hz 
  from the SparkFun TMP102 Temperature Sensor.
  
  MIT License
  Copyright (C) 2021 aiWerkstatt(TM)
  www.aiWerkstatt.com
*/

#include <Wire.h>
#include <SparkFunTMP102.h>

TMP102 temperature_sensor;

void setup() 
{
  SerialUSB.begin(115200);
  while (!SerialUSB);
  
  Wire.begin();
  Wire.setClock(400000);
  delay(500);

  /* Connect to SparkFun TMP102 Temperature Sensor */
  if(!temperature_sensor.begin())
  {
    SerialUSB.println("Can not connect to SparkFun TMP102 Temperature Sensor");
    while(1);
  }
  
  SerialUSB.println("SparkFun TMP102 Temperature Sensor");
  delay(100);
  
  /* Set the Conversion Rate (how quickly the sensor gets a new reading)
     0-3: 0:0.25Hz, 1:1Hz, 2:4Hz, 3:8Hz */
  temperature_sensor.setConversionRate(1);
  
  /* Set Extended Mode.
     0:12-bit Temperature(-55C to +128C) 1:13-bit Temperature(-55C to +150C) */
  temperature_sensor.setExtendedMode(0);
}
 
void loop()
{
  float temperature = 0.0;
  
  /* Turn sensor on to start temperature measurement.
     Current consumption typically ~10uA. */
  temperature_sensor.wakeup();

  /* Read temperature */
  temperature = temperature_sensor.readTempC();
  
  /* Place sensor in sleep mode to save power.
     Current consumption typically <0.5uA. */
  temperature_sensor.sleep();

  /* Print temperature */
  SerialUSB.print("Temperature [C]: ");
  SerialUSB.println(temperature);
    
  delay(1000);
}
