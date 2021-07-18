/*
  Read range in mm from the MaxBotix HRLV-MaxSonar-EZ4 Ultrasonic Range Finder
  from the serial TTL TX using the UART on the SparkFun RedBoard Turbo.

  MIT License
  Copyright (C) 2021 aiWerkstatt(TM)
  www.aiWerkstatt.com
 */

void setup()
{
  SerialUSB.begin(115200);
  while (!SerialUSB);
  
  Serial1.begin(9600); /* UART serial port: pins RX/D0 and TX/D1 (not used) */

  SerialUSB.println("MaxBotix HRLV-MaxSonar-EZ4 Ultrasonic Range Finder");
}

void loop()
{
  int range = 0;
  
  range = read_range();
  
  /* Print range */
  SerialUSB.print("Range [mm]: ");
  SerialUSB.print(range);
  SerialUSB.println();
}

int read_range()
{
  /* synchronize with start byte */
  while (!Serial1.available() || (Serial1.read() != 'R'));

  /* read data byte by byte */
  int index = 0;
  char inData[4] = {0x00, 0x00, 0x00, 0x00}; // 4 byte data
  while (true)
  {
    if (Serial1.available())
    {
      char rByte = Serial1.read();        
      // stop byte
      if (rByte == 13)
      {
        return atoi(inData);
      }
      inData[index++] = rByte;              
    }
  }
}
