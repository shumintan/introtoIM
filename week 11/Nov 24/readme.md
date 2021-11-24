# Week 11: Production Assignment

## Synopsis:
Production assignment!

- Make something that uses only one sensor on Arduino and make the ellipse in Processing move on the horizontal axis, in the middle of the screen, and nothing on Arduino is controlled by Processing
- Make something that controls the LED brightness from Processing
- Take the gravity wind example (https://github.com/aaronsherwood/introduction_interactive_media/blob/master/processingExamples/gravityExamples/gravityWind/gravityWind.pde) and make it so every time the ball bounces one led lights up and then turns off, and you can control the wind from one analog sensor

## What I did:

- step 1: 
I started off with the code we first used in class to create the moving horizontal ball, then I decided to play with the code and create my own mini game. 

- step 2: 
I wanted the game to be about droughts and the scarcity of water. So I added an image of a bucket collecting water. The bucket is controlled with the potentiometer's knob. Twisting it will move the bucket horizontally to collect the droplets. 

![](BucketAndDroplet.png)

- step 3:
I added a timer and a 'point' system to keep track of the droplet collected. 

![](BucketAndTimer.png)

## Outcome
Overall, my final outcome consists of two main digital sensors that controls which tune is played. 

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

