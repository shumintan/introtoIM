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
}
