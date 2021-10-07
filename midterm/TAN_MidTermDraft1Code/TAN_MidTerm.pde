Ball ball1;
Ball ball2;
Player p;
String s;
PImage flag; // for the flag

void setup() {
  size(800, 300);

  // Initialize balls
  ball1 = new Ball(64);
  ball2 = new Ball(32);

  p = new Player ();
  s = " ";

  /* left = false;
   right = false;
   up = false; 
   down = false; */
}

void draw() {
  background(0);

  // Move and display balls
  ball1.move();
  ball2.move();
  ball1.display();
  ball2.display();

  // Player
  p.update ();
  p.display();

  //Flag
  flag = loadImage ("Flag.png");
  flag.resize (30, 0);
  image (flag, 750, 50);

  fill (255);
  textSize (20);
  text ("timer:", 50, 50); // need to add a timer
}

void keyPressed () {
  //  s = "key: " + keyCode;
  /* switch (keyCode) {
   case 37: // left
   left = true;
   break; 
   case 38: // up
   up = true;
   break;
   case 39: // right
   right = true;
   break;
   case 40: // down
   down = true; 
   break;
   } */  // blocking out to try sherwoods method
}

void keyReleased () {
}
