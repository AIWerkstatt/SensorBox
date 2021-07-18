/*
  Configure the SparkFun USB-C Power Delivery Board
  to provide up to 30W (20V@1.5A)to the NVIDIA Jetson Xavier NX
  using a USB-C Power Bank that can provide 60W (20V@3A) as the source.

  MIT License
  Copyright (C) 2021 aiWerkstatt(TM)
  www.aiWerkstatt.com
*/

#include <Wire.h>
#include <SparkFun_STUSB4500.h>

STUSB4500 usbc_pd;

void setup() 
{
  SerialUSB.begin(115200);
  while (!SerialUSB);
  
  Wire.begin();  
  delay(500);
  
  /* Connect to SparkFun USB-C Power Delivery Board */
  if(!usbc_pd.begin())
  {
    SerialUSB.println("Can not connect to SparkFun USB-C Power Delivery Board.");
    while(1);
  }
  
  SerialUSB.println("SparkFun USB-C Power Delivery Board");
  delay(100);

  /* Set Number of Power Data Objects (PDO) 1-3 */
  usbc_pd.setPdoNumber(2);

  /* PDO2
   - Voltage 20V
   - Current value for PDO2 1.5A
   - Under Voltage Lock Out (setUnderVoltageLimit) 10% (~18V)
   - Over Voltage Lock Out (setUpperVoltageLimit) 5% (~21V) */
  usbc_pd.setVoltage(2, 20.0);
  usbc_pd.setCurrent(2, 0.5); 
  /* Workaround: Somehow using 0.5 here results in 1.5 */
  usbc_pd.setLowerVoltageLimit(2, 10);
  usbc_pd.setUpperVoltageLimit(2, 5);

  /* Selects VBUS_EN_SNK pin configuration */
  usbc_pd.setPowerAbove5vOnly(true);

  /* Write and save settings in Non-Volatile Memory (NVM)*/
  usbc_pd.write();
  
  /* Read the NVM settings to verify the new settings are correct */
  usbc_pd.read();

  SerialUSB.println("New Parameters:\n");

  /* Read the Power Data Objects (PDO) highest priority */
  SerialUSB.print("PDO Number: ");
  SerialUSB.println(usbc_pd.getPdoNumber());

  /* Read settings for PDO1 */
  SerialUSB.println();
  SerialUSB.print("Voltage1 (V): ");
  SerialUSB.println(usbc_pd.getVoltage(1));
  SerialUSB.print("Current1 (A): ");
  SerialUSB.println(usbc_pd.getCurrent(1));
  SerialUSB.print("Lower Voltage Tolerance1 (%): ");
  SerialUSB.println(usbc_pd.getLowerVoltageLimit(1));
  SerialUSB.print("Upper Voltage Tolerance1 (%): ");
  SerialUSB.println(usbc_pd.getUpperVoltageLimit(1));
  SerialUSB.println();

  /* Read settings for PDO2 */
  SerialUSB.print("Voltage2 (V): ");
  SerialUSB.println(usbc_pd.getVoltage(2));
  SerialUSB.print("Current2 (A): ");
  SerialUSB.println(usbc_pd.getCurrent(2));
  SerialUSB.print("Lower Voltage Tolerance2 (%): ");
  SerialUSB.println(usbc_pd.getLowerVoltageLimit(2));
  SerialUSB.print("Upper Voltage Tolerance2 (%): ");
  SerialUSB.println(usbc_pd.getUpperVoltageLimit(2));
  SerialUSB.println();

  /* Read the bit that enables VBUS_EN_SNK pin only when power is greater than 5V */
  SerialUSB.print("Enable Power Only Above 5V: ");
  SerialUSB.println(usbc_pd.getPowerAbove5vOnly());
}

void loop()
{
}
