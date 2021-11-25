char val; 
int ledPin = 3; 

void setup() {
  pinMode(ledPin, OUTPUT); 
  Serial.begin(9600);
}
void loop() {

  // this is for the redLEDPin
  if (Serial.available())
  { // If data is available to read,
    val = Serial.read(); // read it and store it in val
  }
  if (val == '1')
  { // If 1 was received
    digitalWrite(ledPin, HIGH); // turn the LED on
  } else {
    digitalWrite(ledPin, LOW); // otherwise turn it off
  }
  delay(10); 

  // this is for the potentiometer
   int sensorValue = analogRead(A0);
  // print out the value you read:
  Serial.println(sensorValue);
  delay(1);   
  
}
