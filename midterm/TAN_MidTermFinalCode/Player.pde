class Player {

  int x, y, w, h, Fx, Fy, rImg; // position
  int direction = 1;
  int step =3 ;
  int speed = 3; // for movement
  PImage flag; // for the flag
  boolean hasTouched = false;

  // Constructor 
  Player () {
    x = 10;
    y = 250;
    w = 20;
    h = 20;
    Fx = 750; // x value for Flag
    Fy = 50; // y value for Flag
    rImg = 20; // radius of image

    //Flag
    flag = loadImage ("Flag.png");
    flag.resize (30, 0);
  }

  // Movement

  void update () {
    image (flag, Fx, Fy, 2*rImg, 2*rImg);

    if (dist((x+ w/2), (y+ h/2), Fx, Fy) <= (w/2) + (rImg)) {
      hasTouched = true;
      Fx = x + 10;
      Fy = y + 20;
    } 

    if (keyPressed) 
    {
      if (keyCode == DOWN && y<280) {
        direction = 0;
        y+=speed;
      }
      if (y>=280)
      {
        direction = 0;
        y-=speed;
      }

      if (keyCode == LEFT && x>0) {
        direction = 1;
        x-=speed;
      }
      if (keyCode == RIGHT && x<780) {
        direction = 2;
        x+=speed;
      }
      if (x>=780) {
        direction = 2;
        x-=speed;
      }
      if (keyCode == UP && y>0) {
        direction = 3;
        y-=speed;
      }
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
