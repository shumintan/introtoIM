class Player {

  int x, y, w, h; // position
  int direction = 1;
  int step =3 ;
  int speed = 3; // for movement

  // Constructor 
  Player () {
    x = 10;
    y = 250;
    w = 20;
    h = 20;
  }

  // Movement

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
      // if (frameCount%speed==0) {
      //   step = (step+1) % 12;
    }
    // Bouncing off horizontal
    if (x > width || x < 0) {
      direction -= 1;
    }
    // Bouncing off vertical
    if (y > height || y < 0) {
      direction -= 1;
    }
  }

  void display () {
    stroke (0);
    fill (255, 0, 0);
    rect (x, y, w, h);
  }
}
