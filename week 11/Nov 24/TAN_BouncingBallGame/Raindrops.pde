class Raindrop {
  float x, y;  
  float speed;  
  color c;
  float r;    

  // this is the constructor
  Raindrop() {
    r = 8;                  
    x = random(width);       
    y = -r*4;                
    speed = random(1, 5);    
    c = color(50, 100, 150);
  }

  // Move the raindrop down
  void move() {
    // Increment by speed
    y += speed;
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  // Display the raindrop
  void display() {
    fill(c);
    noStroke();
    for (int i = 2; i < r; i++ ) {
      ellipse(x, y + i*4, i*2, i*2);
    }
  }

  // If the raindrop is caught
  void caught() {
    speed = 0; 
    y = -1000;
  }
}
