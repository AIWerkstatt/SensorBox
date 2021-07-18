/* 
  Read current in Ampere, voltage in Volt and power in Watt at 1Hz 
  from the Zio INA219 Current and Voltage Sensor.
  
  MIT License
  Copyright (C) 2021 aiWerkstatt(TM)
  www.aiWerkstatt.com
*/

#include <Wire.h>
#include <Adafruit_INA219.h>

Adafruit_INA219 power_sensor;

void setup() 
{
  SerialUSB.begin(115200);
  while(!SerialUSB);

  Wire.begin();
  Wire.setClock(400000);
  delay(500);
        
  /* Connect to Zio INA 219 Current and Voltage Sensor */
  if (!power_sensor.begin()) {
    SerialUSB.println("Can not connect to Zio INA 219 Current and Voltage Sensor");
    while(1);
  }  
  
  SerialUSB.println("Zio INA 219 Current and Voltage Sensor");
  delay(100);
}

void loop(void) 
{
  float shuntvoltage = 0.0;
  float busvoltage = 0.0;
  float current_mA = 0.0;
  float loadvoltage = 0.0;
  float power_mW = 0.0;

  shuntvoltage = power_sensor.getShuntVoltage_mV();
  busvoltage = power_sensor.getBusVoltage_V();
  current_mA = power_sensor.getCurrent_mA();
  power_mW = power_sensor.getPower_mW();
  loadvoltage = busvoltage + (shuntvoltage / 1000.0);
  
  SerialUSB.print("Bus Voltage [V]: "); 
  SerialUSB.print(busvoltage);
  SerialUSB.print(" Shunt Voltage [mV]: "); 
  SerialUSB.print(shuntvoltage);
  SerialUSB.print(" Load Voltage [V]: "); 
  SerialUSB.print(loadvoltage);
  SerialUSB.print(" Current [mA]: "); 
  SerialUSB.print(current_mA);
  SerialUSB.print(" Power [mW]: "); 
  SerialUSB.print(power_mW);
  SerialUSB.println();

  delay(1000);
}
