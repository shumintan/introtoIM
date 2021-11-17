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
![] (PotentiometerSchematic.png)

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

![](TAN_UnusualSwitch2.png)

## Outcome
Overall, my final outcome consists of two main digital sensors that controls which tune is played. 

![](TAN_UnusualSwitch2.png)

When the greenButton is HIGH, the idea is to rotate the potentiometer so that the frequency changes with it. 
When the yellowButton is HIGH, the idea is that the Game of Thrones main theme song will play. 

## Challenges
The biggest challenge for me over this project is understanding the functionality of the breadboard and trying to imagine the flow of electricity from arduino to the breadboard. I also found it difficult to come up with a creative and unusual switch. Because it was difficult for the wires to touch each other, I had to find sheets of metal that I wrapped around the coil to make sure that it has a greater surface area and sensitivity. 

## Reflections
The shift from coding to electricity is a bit of a jump for me. This last week has been a little challenging in class too. I know I can always freely ask questions in class too, but sometimes I feel like I'm not sure what I should be asking or what I might be missing out. I do enjoy the hands-on work that we do in class and my favorite part is uploading arduino code and seeing the LED light up. I found it very amusing when I was building my circuit for the unusual switch - happy that I could take something I do in my everyday life and incorporate it.
