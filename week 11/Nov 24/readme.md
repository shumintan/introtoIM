# Week 11: Production Assignment
Production assignment - make a siple game that involves some kind of communication between Arduino and Processing!


## Synopsis:
- Make something that uses only one sensor on Arduino and make the ellipse in Processing move on the horizontal axis, in the middle of the screen, and nothing on Arduino is controlled by Processing
- Make something that controls the LED brightness from Processing
- Take the gravity wind example (https://github.com/aaronsherwood/introduction_interactive_media/blob/master/processingExamples/gravityExamples/gravityWind/gravityWind.pde) and make it so every time the ball bounces one led lights up and then turns off, and you can control the wind from one analog sensor
- EXTRA CREDIT Due Nov. 24th
Make a simple game that involves some kind of communication between Arduino and Processing

## What I did:

- step 1: 
I started off with the code we first used in class to create the moving horizontal ball, then I decided to play with the code and create my own mini game. 

- step 2: 
I decided to create multiple moving balls that would bounce around on screen, and the idea would be that clicking on these balls would allow the player to accumulate point values. 

![](BucketAndDroplet.png)

- step 3:
With every click of 'mousePressed()' the idea was to send a serial message to Arduino so that the redLEDPin would light up. 

![](BucketAndTimer.png)

- step 4: 
I added a potentiometer to my breadboard and decided that the value (based on the turnof the knob) will determine the color gradient of the balls on screen. This is the following schematic that I used to create this:

![](BucketAndTimer.png)

- step 5:
I added a timer and a 'point' system to keep track of the droplet collected. 

## Outcome
Overall, this is my final outcome:

![](

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



````

  ````

## Challenges


## Reflections

