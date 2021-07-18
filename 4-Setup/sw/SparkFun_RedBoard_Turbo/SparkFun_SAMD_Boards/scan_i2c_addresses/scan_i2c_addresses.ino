/*
  Scan for I2C addresses.
  
  MIT License
  Copyright (C) 2021 aiWerkstatt(TM)
  www.aiWerkstatt.com
*/

#include <Wire.h>

void setup() 
{
  SerialUSB.begin(115200);
  while (!SerialUSB);
  
  Wire.begin();
  Wire.setClock(400000);
  delay(500);
  
  pinMode(LED_BUILTIN, OUTPUT);

  /* If no I2C is connected, all addresses will be reported as found */
  for (byte address = 8; address < 120; address++)
  {    
    /* LED should blink with each address check */
    digitalWrite(LED_BUILTIN, HIGH);
    delay (250);    
    digitalWrite(LED_BUILTIN, LOW);    
    delay (250);
    /* Check I2C address */
    SerialUSB.print("Check I2C address: 0x");
    SerialUSB.print(address, HEX);
    Wire.beginTransmission(address);
    if (Wire.endTransmission() == 0)
    {
      SerialUSB.print(" found");
    }
    SerialUSB.println();
  }
}

void loop() 
{
}
