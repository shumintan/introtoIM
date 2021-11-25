PImage bucket;

class Catcher {
  float r;    // radius
  color col;  // color
  float x, y; // location

  Catcher(float tempR) {
    r = tempR;
    col = color(50, 10, 10, 150);
    x = 0;
    y = 0;
  }

  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    bucket = loadImage ("Bucket.png");
    bucket.resize (50, 0);
    image (bucket, inByte, 400);
  }

  boolean intersect(Raindrop d) {
    // Calculate distance
    float distance = dist(x, y, d.x, d.y); 

    if (distance < r + d.r) { 
      return true;
    } else {
      return false;
    }
  }
}
