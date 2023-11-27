Softwares/Links Needed

Code:
https://codeshare.io/km9X13

Arduino IDE
https://www.arduino.cc/en/software

16x2 LCD Module Library
https://codeload.github.com/johnrickman/LiquidCrystal_I2C/zip/refs/heads/master

CP210X Universal Windows Drivers 
https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers?tab=downloads

Additional Libraries
For LCD:
1. Download the 16x2 LCD Library
2. Go to Sketch > Include Library > Add .ZIP File
3.Find the downloaded LCD Library .ZIP file “LiquidCrystal_I2C-master.zip”
4. Add the library
5. Done!

For DHT22 Sensor:
1. Go to Sketch > Include Library > Manage Library
2. Type “DHT” and click install on the “DHT sensor library by Adafruit”
3. Done!

What to Do When Uploading the Code
1. Open Serial Monitor (Tools > Serial Monitor)
2. Wait until the “Compiling” message is gone
3. When the “Uploading” message shows up, hold the BOOT button on the ESP32 Board
4. When the Serial Monitor shows values with %, let go of the BOOT button
5.ce complete, press the EN button once. 



PINS / WIRING GUIDE
![image](https://github.com/raedrian/corn-moisture-monitoring-system/assets/60420630/0c4ee75f-05f8-459d-925b-969ebb6f42ba)



Left: ESP32, Right: Module/Sensor Pins

![image](https://github.com/raedrian/corn-moisture-monitoring-system/assets/60420630/3c6d0b68-b356-4c39-a39f-a326b277575b)
