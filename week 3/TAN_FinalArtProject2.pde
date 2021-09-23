
class Rain {
  float x= random (width);
  float y = random (30, 50);
  float yspeed = random (1, 10);

  void fall () {
    y = y + yspeed;

    if (y > height) {
      y = random (30, 50);
    }
  }

  void show () {
    stroke (100, 0, 0);
    line (x, y, x, y+15);
  }
}


Rain [] rains = new Rain[100];


void setup () {
  size (700, 500);
  for (int i = 0; i < rains.length; i++) {
    rains[i] = new Rain();
  }
}

void draw () {
  background (255, 255, 255);
  for (int i = 0; i < rains.length; i++) {
    rains[i].show ();
    rains[i].fall ();
  }

  stroke (0, 0, 0);
  line (260, 250, width, 500);
  line (260, 250, 0, height);

  // this is the clouds
  noStroke ();
  fill (100, 220);
  ellipse (10, 10, 180, 50); 
  ellipse (470, 40, 180, 50); 

  fill (175);
  ellipse (100, 70, 180, 50); 
  ellipse (200, 70, 200, 100); 
  ellipse (300, 70, 210, 100); 
  ellipse (400, 80, 200, 50);

  // this is the door
  fill (0);
  rect (260, 200, 10, 60);

  // window wipers
  fill (0);
  pushMatrix ();
  translate (265, 200);
  ellipseMode (CENTER);
  rotate (radians (frameCount * 1% 360));
  ellipse (0, 0, 80, 10);
  ellipse (0, 0, 10, 80);
  ellipse (0, 0, 20, 5);
  ellipse (0, 0, 5, 20);
  popMatrix ();

  fill (255);
  circle (265, 200, 10);
}
