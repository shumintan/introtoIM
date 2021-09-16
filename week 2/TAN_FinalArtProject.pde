void setup () {
  size (600, 600);
}

// first layer
void draw () {
  background (0); 
  stroke (random (0, 255));
  strokeWeight (2);

  fill(50, 230, 232, 100);
  circle (50, 20, 20);
  circle (560, 40, 50);
  circle (50, 560, 100);
  circle (580, 100, 100);
  circle (450, 30, 20);

  fill(50, 230, 232, 136);
  ellipse(width/2, height/2, 500, 500);
  ellipse(width/2, height/2, 300, 300);

  fill(100, 233, 234, 187);
  ellipse(width/2, height/2, 350, 350);

  fill(80, 233, 234, 157);
  ellipse(width/2, height/2, 200, 200);

  fill(50, 230, 232, 136);
  ellipse(width/2, height/2, 150, 150);
  ellipse(width/2, height/2, 100, 100);

  fill(50, 230, 232, 136);
  ellipse(2, 2, 500, 500);
  ellipse(598, 598, 500, 500);

  fill(50, 230, 232, 187);
  ellipse(2, 2, 400, 400);
  ellipse(598, 598, 400, 400);

  fill(50, 230, 232, 100);
  ellipse(2, 2, 300, 300);
  ellipse(598, 598, 300, 300);

  fill(50, 230, 232, 100);
  ellipse(2, 2, 200, 200);
  ellipse(598, 598, 200, 200);

  int x = 0;
  while (x < 300) {
    line (x, 0, x, height);
    x = x + 8;
  }
  
}
