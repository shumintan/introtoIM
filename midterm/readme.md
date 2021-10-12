# Midterm

Yes - you've guessed it! We have already reached our mid-term project and I am absolutely terrified.

## Synopsis:

Make a game using everything we have learned so far. Can be one or more players. Some required elements: 
- one shape
- one image
- one sound
- one on-screen text

The game must:
- start with a screen giving instruction
- wait at the start screen until a button or key (your choice) is pressed
- after the game is won or lost, there must be a way to restart the game wihtout closing and restarting the program

## What I did:

**Oct 1 - I started by playing with images, transformation, and inserting images.**
![](TAN_Donut.png)

This is an animation of a donut rotating across the x-axis.  
I wasn't very happy with what it produced, but I used similar concepts in terms of code for my next idea. 

**Oct 3 - I started to incorporate the code to animate two circles.**
![](TAN_TwoCircles.png)

This is an animation of two circles bouncing off the walls. I used codes from my first initial idea and was later inspired by an example found on Processing Library by Daniel Shiffman. Am still unsure where I want my midterm game to go (I realize that I was too inept to produce anything fancy, so decided to explore and adapt as I learned new ways to code). 

**Oct 5 - I began to add new elements to this draft.**
![](TAN_CaptureTheFlag.png)

I changed the color of the background to black and circles to green so the game looks better aesthetically! 
I added the following code to animate a red square to move when directed by the arrow buttons.

````
  void update () {
    if (keyPressed) {
      if (keyCode == DOWN) {
        direction = 0;
        y+=speed;
      }
      if (keyCode == LEFT) {
        direction = 1;
        x-=speed;
      }
      if (keyCode == RIGHT) {
        direction = 2;
        x+=speed;
      }
      if (keyCode == UP) {
        direction = 3;
        y-=speed;
      } 
````

I finally inserted a picture of a flag and decided to make a game that is similarly mimics capture the flag. Players must direct the red square and avoid touching the green boulders otherwise they have to restart the game. Looking to incorporate a timer in the left hand corner to challenge the player to collect the flag as fast as they can. 

**Oct 10 - I starting working on creating new screens.**

screen 1 as an intro page,
screen 2 as the game,
screen 3 as the won/lost page.

![](TAN_IntroPage.png)

![](TAN_GamePage.png)

![](TAN_Ending.png)

**Oct 10 - I decided to replace 'timer' with 'homeBase,' then added some background music for suspense.**

````
Game game; 

import processing.sound.*;
SoundFile music;

void setup() {
  game = new Game ();
  size(800, 300);

  music = new SoundFile (this, "mixkit-retro-game.mp3");
  music.loop ();
  music.play();
}
void draw() {

  background(0);
  boolean playing = true; // for the music
  game.display (); 
  if (game.screen == 3 && mousePressed) { 
    println ("here");
    game = new Game (); // creating a new game once mouse is pressed
  }
````
**Oct 12 - And that's the final outcome!!** 

^^ Feel free to copy the code and wishing you the best of luck in this game!

## Challenges
At the very start of the project, I remember being completely and utterly lost. I had ideas that I wanted to create but did not know if they were too difficult to execute and code. Something I struggled with (and still am now) is figuring out where I should place codes (e.g. in which tab? nder which void?). I'm not quite sure if I am explaining this correctly... An instance of this struggle would be when I wanted to add sound to my code, but didn't know where to input my code for music in my existing code. I referred to many of Processing's help page, so thank goodness!

## Reflection
I am really really happy with my final outcome, I treat this game like it's my baby! Although it was really challenging, I would say that it solidified existing knowledge that I already know and reviewed things that I was unsure of (and even thing I didn't know I was unsure of)! I can remember laughing and cheering when I got the flag to ''follow'' my player back home - best feeling ever. Nonetheless, I'm not sure if it is a process I want to repeat all over again, but I really enjoyed creating the intro / ending pages where I could play with design a little more. 



