# Week 10: Arduino Musical Instrument
Make a musical instrument!

## Synopsis:
Our assignment was to create a musical instrument with Arduino and to fulfill the following criterions:

- You must use at least one digital sensor (switch)
- You must use at least one analog sensor (photoresistor, potentiometer)
- You may use the distance measuring sensor if you wish

## What I did:

- step 1: 
I started this project by reviweing how to connect the buzzer and the potentiometer. I used the following schematics from the lecture notes and from the SparkFun Inventor's Kit to help strengthen my basic understanding of the two components before visualizing my final musical instrument:

![](PotentiometerSchematic.png)

- step 2: 
After I connected my buzzer, I decided to play around with creating pitches and a melody. I ended up with a melody that played the Game of Thrones main theme song. 

````

// notes in the melody:
const int melody[] = {
  NOTE_E4, NOTE_A3, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_A3, NOTE_C4, NOTE_D4, NOTE_B3, NOTE_C4, NOTE_C4, NOTE_D4, NOTE_B3, NOTE_C4, NOTE_B3, NOTE_D4, NOTE_G3, NOTE_C4, NOTE_B3, NOTE_A3
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
const  int noteDurations[] = {
  2, 2, 8, 8, 4, 4, 8, 8, 1, 8, 8, 4, 4, 8, 8, 4, 4, 8, 8, 1

````

- step 3:
I decided to use the potentiometer as my analog sensor and add buttons as my digital sensors. I drew up a schematic to show what I wanted the circuit to look like and function as:

![](MusicalInstrumentSchematic.png)

## Outcome
Overall, my final outcome consists of two main digital sensors that controls which tune is played. 

![](MusicalInstrument.png)

When the greenButton is HIGH, the idea is to rotate the potentiometer so that the frequency changes with it. 
Play [Here] (https://drive.google.com/file/d/1N4cZVIRxaOwQMGfQabI4HTnZX4zqrM6x/view?usp=sharing)

````
 if (greenSwitchState == HIGH ) {
    //map the potentiometer value to be frequency
    volumeValue = map(volumeValue, 0, 1023, 31, 4978);
    tone(8, volumeValue, 250);
    delay(300);
    noTone(8);
  }   else if (greenSwitchState == LOW);

  noTone(8);
````

When the yellowButton is HIGH, the idea is that the Game of Thrones main theme song will play. 
Play [Here] (https://drive.google.com/file/d/1XXnd4mYxdjiFpEt88B1GoIjqVa5sw2Jj/view?usp=sharing)

````
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
  ````

## Challenges

## Reflections
