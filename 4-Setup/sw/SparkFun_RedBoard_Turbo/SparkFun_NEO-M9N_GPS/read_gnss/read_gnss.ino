/*
  Read latitude in degrees, longitude in degrees, altitude in meter,
  fix type (no fix, dead reckoning, 2D, 3D, GNSS + Dead reckoning, Time only),
  ground speed in meter per seconds, heading in degrees,
  dilution of precision, number of satellites used in fix,
  and date and time at 1Hz
  from the SparkFun NEO-M9N GPS.

  MIT License
  Copyright (C) 2021 aiWerkstatt(TM)
  www.aiWerkstatt.com
 */

#include <Wire.h>
#include <SparkFun_u-blox_GNSS_Arduino_Library.h>

SFE_UBLOX_GNSS gnss;

long last_time = 0;

void setup()
{
  SerialUSB.begin(115200);
  while (!SerialUSB);
  
  Wire.begin();
  Wire.setClock(400000);
  delay(500);

  if (!gnss.begin())
  {
    SerialUSB.println("Can not connect to SparkFun NEO-M9N GPS");
    while (1);
  }
  
  SerialUSB.println("SparkFun NEO-M9N GPS");
  delay(100);

  gnss.setI2COutput(COM_TYPE_UBX);
  gnss.setNavigationFrequency(1);
    
  uint8_t rate = gnss.getNavigationFrequency();
  SerialUSB.print("Current update rate: ");
  SerialUSB.println(rate);  
}

void loop()
{ 
  if (millis() - last_time > 1000)
  {
    last_time = millis();

    long latitude = gnss.getLatitude();
    SerialUSB.print(F("Lat [degrees]: "));
    SerialUSB.print(latitude / 10000000.0);

    long longitude = gnss.getLongitude();
    SerialUSB.print(F(" Long [degrees]: "));
    SerialUSB.print(longitude / 10000000.0);

    long altitude = gnss.getAltitude();
    SerialUSB.print(F(" Alt [m]: "));
    SerialUSB.print(altitude / 1000.0);
    
    long altitudeMSL = gnss.getAltitudeMSL();
    SerialUSB.print(F(" AltMSL [m]: "));
    SerialUSB.print(altitudeMSL / 1000.0);

    byte fixType = gnss.getFixType();
    SerialUSB.print(F(" Fix: "));
    if(fixType == 0) SerialUSB.print(F("No fix"));
    else if(fixType == 1) SerialUSB.print(F("Dead reckoning"));
    else if(fixType == 2) SerialUSB.print(F("2D"));
    else if(fixType == 3) SerialUSB.print(F("3D"));
    else if(fixType == 4) SerialUSB.print(F("GNSS + Dead reckoning"));
    else if(fixType == 5) SerialUSB.print(F("Time only"));
    
    long speed = gnss.getGroundSpeed();
    SerialUSB.print(F(" Speed [m/s]: "));
    SerialUSB.print(speed / 1000.0);

    long heading = gnss.getHeading();
    SerialUSB.print(F(" Heading [degrees]: "));
    SerialUSB.print(heading / 100000);

    int pDOP = gnss.getPDOP();
    SerialUSB.print(F(" pDOP: "));
    SerialUSB.print(pDOP / 100.0, 2);
    
    byte SIV = gnss.getSIV();
    SerialUSB.print(F(" SIV: "));
    SerialUSB.print(SIV);

    SerialUSB.print(" ");
    SerialUSB.print(gnss.getYear());
    SerialUSB.print("-");
    SerialUSB.print(gnss.getMonth());
    SerialUSB.print("-");
    SerialUSB.print(gnss.getDay());
    SerialUSB.print(" ");
    SerialUSB.print(gnss.getHour());
    SerialUSB.print(":");
    SerialUSB.print(gnss.getMinute());
    SerialUSB.print(":");
    SerialUSB.print(gnss.getSecond());

    SerialUSB.print("  Time is ");
    if (!gnss.getTimeValid())
    {
      SerialUSB.print("not ");
    }
    SerialUSB.print("valid  Date is ");
    if (!gnss.getDateValid())
    {
      SerialUSB.print("not ");
    }
    SerialUSB.print("valid");
    
    SerialUSB.println();
  }    
}
