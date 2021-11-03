class Ball {

  float r;   // radius
  float x, y; // location
  float xspeed, yspeed; // speed

  // Constructor
  Ball(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random( - 5, 5);
    yspeed = random( - 5, 5);
  }

  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y

    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= -1;
    }
    //Check vertical edges
    if (y > height || y < 0) {
      yspeed *= -1;
    }
  }

  // Draw the ball
  void display() {
    stroke(255);
    fill(0, 255, 0); // i want to make it a different color everytime
    ellipse(x, y, r*2, r*2);
  }
}