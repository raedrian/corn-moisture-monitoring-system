#include <DHT.h>
#include <WiFi.h>
#include <HTTPClient.h>
#define DHT_SENSOR_PIN 23            // ESP32 pin GIOP21 connected to DHT22 sensor
#define DHT_SENSOR_TYPE DHT22

#include <LiquidCrystal_I2C.h>
int lcdColumns = 16;
int lcdRows = 2;

DHT dht_sensor(DHT_SENSOR_PIN, DHT_SENSOR_TYPE);
LiquidCrystal_I2C lcd(0x27, lcdColumns, lcdRows);

int moisturePin = A0;               // moisture sensor pin
int humi;

//Remove Comments when changing Wifi
const char WIFI_SSID[] = "jphone123";
const char WIFI_PASSWORD[] = "abisuson110719";

//const char WIFI_SSID[] = "Kahoy na Balay";
//const char WIFI_PASSWORD[] = "6cPalmtree";


//Local Server

String HOST_NAME = "http://127.0.0.1"; // change to your PC's IP address
String PATH_NAME   = "/insert_humi.php";
String queryString = "?humi=";


//Home Testing
/*
String HOST_NAME = "http://192.168.1.4"; // change to your PC's IP address
String PATH_NAME   = "/insert_humi.php";
String queryString = "?humi=";
*/

void setup() {
  Serial.begin(9600);
  dht_sensor.begin();               // initialize the DHT sensor

  lcd.init();                      // initialize LCD
  lcd.backlight();                  // turn on LCD backlight

  delay(2000);
  Serial.println("Corn Dryer Monitoring");

  lcd.setCursor(0, 0);
  lcd.print("Corn Dryer");
  lcd.setCursor(0, 1);
  lcd.print("Monitoring");
  delay(4000);
  lcd.clear();

  Serial.println("Initializing...");
  Serial.println("Please Wait");

  lcd.setCursor(0, 0);
  lcd.print("Initializing...");
  lcd.setCursor(0, 1);
  lcd.print("Please Wait");
  delay(2000);

  Serial.print("Connecting to WiFi network ;");
  Serial.print(WIFI_SSID);
  Serial.println("'...");
  

  lcd.setCursor(0, 0);
  lcd.print("Connecting to");
  lcd.setCursor(0, 1);
  lcd.print("WiFi");

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  delay(2000);

  while (WiFi.status() != WL_CONNECTED) {
    lcd.clear();
    Serial.println("Connecting...");
    String connect, period;
    connect = "Connecting";
    period = "."

    int dot = 0;
    while (dot < 4)
    {
      lcd.setCursor(0, 0);
      lcd.print(connect);
      connect = connect + period;
      delay(1000);
      dot++;
    } 
    
  }
  lcd.clear();
  Serial.println("Connected!");
  lcd.setCursor(0, 0);
  lcd.print("Connected!");
  delay(2000);
  
  lcd.clear();

  Serial.print("Connected to WiFi network with IP Address: ");
  Serial.println(WiFi.localIP());

}

void loop() {

  humi = analogRead(moisturePin);
  humi = map(humi,0,4095,100,0);
  //int humi  = dht_sensor.readHumidity();
  int tempC = dht_sensor.readTemperature();

  //For Testing Change Values Here
  //humi = 15;
  //tempC =140;

  // check whether the reading is successful or not
  if (isnan(tempC) || isnan(humi)) {
    Serial.println("Failed to read from DHT sensor!");
    lcd.setCursor(0, 0);
    lcd.print("Sensor Error");
  }

  else {
    lcd.clear();
    Serial.print("Humidity: ");
    Serial.print(humi);
    Serial.print("%");
    Serial.print("  |  ");
    Serial.print("Temperature: ");
    Serial.print(tempC);
    Serial.print("C  ~  ");

    lcd.setCursor(0, 0);
    lcd.print("Temp: ");
    lcd.print(tempC);
    lcd.print("C");

    lcd.setCursor(0, 1);
    lcd.print("Humi: ");
    lcd.print(humi);
    lcd.print("%");

    delay(4000);

    if (tempC >= 100 && tempC <= 140) {
      lcd.clear();
      Serial.println("Heated Air Temperature Achieved");
      lcd.setCursor(0, 0);
      lcd.print("Optimal Temp");
      lcd.setCursor(0, 1);
      lcd.print("Achieved");
      delay(2000);
    }

    if (humi <= 18) {
      if (humi < 14) {
        lcd.clear();
        Serial.println("Moisture Too Dry");

        lcd.setCursor(0, 0);
        lcd.print("Moisture");
        lcd.setCursor(0, 1);
        lcd.print("Too Dry");
        delay(2000);
      }

      else if (humi >= 14 && humi <= 15) {
        lcd.clear();
        Serial.println("Corn is at the optimal moisture dryness level");

        lcd.setCursor(0, 0);
        lcd.print("Optimal Moisture");
        lcd.setCursor(0, 1);
        lcd.print("Achieved");


        //Send Data to mySQL
        HTTPClient http;

        http.begin(HOST_NAME + PATH_NAME + queryString + humi); //HTTP
        int httpCode = http.GET();

        // httpCode will be negative on error
        if(httpCode > 0) {
          // file found at server
          if(httpCode == HTTP_CODE_OK) {
            String payload = http.getString();
            Serial.println(payload);
          } 
          else {
            // HTTP header has been send and Server response header has been handled
            Serial.printf("[HTTP] GET... code: %d\n", httpCode);
            lcd.setCursor(0, 0);
            lcd.print("Data Sent");
            lcd.setCursor(0, 1);
            lcd.print("SUCCESS");
            delay(3000);
            lcd.clear();
          }
        } else {
          Serial.printf("[HTTP] GET... failed, error: %s\n", http.errorToString(httpCode).c_str());
          lcd.setCursor(0, 0);
          lcd.print("Data Sent");
          lcd.setCursor(0, 1);
          lcd.print("FAILED");
          delay(3000);
          lcd.clear();
        }

        http.end();
        
        delay(2000);
      }

      else {
        lcd.clear();
        Serial.println("Corn is almost at the optimal moisture dryness level");

        lcd.setCursor(0, 0);
        lcd.print("Optimal Moisture");
        lcd.setCursor(0, 1);
        lcd.print("Almost Achieved");
        delay(2000);
      }
    }
  }

  // wait a 2 seconds between readings
  delay(1000);
  Serial.println();
}