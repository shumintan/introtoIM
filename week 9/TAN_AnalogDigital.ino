const int blueLED = 6; // this is for the blue light
const int redLED = 5; // this is for the red light
const int blueButton = A2; // this is for the blue switch
const int ldrPin = A1; // this is for the light sensor

void setup() {
  // put your setup code here, to run once:
  pinMode (ldrPin, INPUT);
  pinMode (blueButton, INPUT);
  pinMode (blueLED, OUTPUT);
  pinMode (redLED, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:

  int ldrValue = analogRead (ldrPin);
  Serial.println (ldrValue);
  ldrValue = constrain (ldrValue, 200, 800);
  int brightness = map (ldrValue, 200, 900, 35, 3000);

  // the light sensor (analog) determines the brightness of redLED
  if (brightness > 150) digitalWrite (redLED, HIGH);
  else digitalWrite (redLED, LOW);


  // the switch (digital) determines if blueLED is off/on

  // new variable of buttonState
  int buttonState = digitalRead (blueButton);
  if (buttonState == HIGH) {
    digitalWrite (blueLED, HIGH);
    delay (100);
    digitalWrite (blueLED, LOW);
    delay (100);
    digitalWrite (blueLED, HIGH);
  }
  else digitalWrite (blueLED, LOW);

}
