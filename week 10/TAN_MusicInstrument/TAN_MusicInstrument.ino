#include "pitches.h"

const int speakerPin = 8;
const int potentiometerPin = A0;
const int greenSwitchPin = A2;
const int yellowSwitchPin = A3;

// notes in the melody:
const int melody[] = {
  NOTE_E4, NOTE_A3, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_A3, NOTE_C4, NOTE_D4, NOTE_B3, NOTE_C4, NOTE_C4, NOTE_D4, NOTE_B3, NOTE_C4, NOTE_B3, NOTE_D4, NOTE_G3, NOTE_C4, NOTE_B3, NOTE_A3
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
const  int noteDurations[] = {
  2, 2, 8, 8, 4, 4, 8, 8, 1, 8, 8, 4, 4, 8, 8, 4, 4, 8, 8, 1
};

void setup() {
  Serial.begin (9600);

  pinMode (potentiometerPin, INPUT);
  pinMode (greenSwitchPin, INPUT);
  pinMode (yellowSwitchPin, INPUT);

}

void loop() {

  int greenSwitchState = digitalRead (greenSwitchPin);
  int yellowSwitchState = digitalRead (yellowSwitchPin);
  int volumeValue = analogRead (potentiometerPin);

  Serial.println (volumeValue);

  if (greenSwitchState == HIGH ) {
    //map the potentiometer value to be frequency
    volumeValue = map(volumeValue, 0, 1023, 31, 4978);
    tone(8, volumeValue, 250);
    delay(300);
    noTone(8);
  }   else if (greenSwitchState == LOW);

  noTone(8);

 if (yellowSwitchState == HIGH) {
    for (int thisNote = 0; thisNote < 20; thisNote++) {
      int noteDuration = 1000 / noteDurations[thisNote];
      tone(8, melody[thisNote], noteDuration);

      int pauseBetweenNotes = noteDuration * 1.3;
      delay(pauseBetweenNotes);
      noTone (8);
    }
  }    else if (yellowSwitchState == LOW );
  noTone (8); 
}
