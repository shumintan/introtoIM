class Game {
  Ball ball1;
  Ball ball2;
  Player p;
  String s;
  PImage homeBase; // for the homeBase
  boolean returnHome = false;

  int screen = 1;
  int Hx = 5; // x value for homeBase
  int Hy = 240; // y value for homeBase
  int rHome = 25; // radius of homeBase

  // Constructor 
  Game () {
    // Initialize balls
    ball1 = new Ball(64);
    ball2 = new Ball(32);

    // Player
    p = new Player ();
    s = " ";

    //Home
    homeBase = loadImage ("homeBase.png");
    homeBase.resize (50, 0);
  }

  // hitting the green boulders
  public void ballTouched () {
    if (dist((p.x+ p.w/2), (p.y+ p.h/2), ball1.x, ball1.y) <= (p.w/2) + (ball1.r)) {
      p.x = 10;
      p.y = 250;
      p.Fx= 750;
      p.Fy =50;
    }
    if (dist((p.x+ p.w/2), (p.y+ p.h/2), ball2.x, ball2.y) <= (p.w/2) + (ball2.r)) {
      p.x = 10;
      p.y = 250;
      p.Fx= 750;
      p.Fy =50;
    }
  }


  public void display () {

    if (screen == 1) {

      //   introMusic.play ();
      fill (255, 255, 255); 
      textSize (100); 
      text("CAPTURE THE", 0, 80);
      fill (0, 255, 0); 
      text("CAPTURE FLAG", 0, 100);
      fill (255, 255, 255); 
      text ("FLAG", 500, 150);

      fill (255, 255, 255); 
      textSize (15); 
      text ("AVOID THE GREEN BOULDERS AND RETURN THE FLAG HOME", 150, 250);
      textSize (13); 
      text("click anywhere to start", 550, 220);
      if (mousePressed) {
        screen = 2;
      }
    } else if (screen == 2) {
      image (homeBase, Hx, Hy, rHome*2, rHome*2);
      ballTouched ();
      // Move and display balls
      ball1.move();
      ball2.move();
      ball1.display();
      ball2.display();

      // Player
      p.update ();
      p.display();

      if (dist (p.Fx, p.Fy, Hx, Hy) <= (p.rImg) + (rHome)) {
        returnHome = true;
        screen = 3;
      }
    } else if (screen == 3) {


      fill (0, 255, 0); 
      textSize (100); 
      text("CONGRATULATIONS", 0, 80);
      fill (0, 255, 0); 
      textSize (80); 
      text("CONGRATULATIONS", 0, 120);
      fill (255, 255, 255); 
      textSize (80); 
      text("CONGRATULATIONS", 0, 100);

      textSize (100); 
      fill (255, 255, 255); 
      text ("FLAG", 495, 200);
      fill (0, 255, 0); 
      text ("FLAG", 500, 205);
      fill (255, 255, 255); 
      textSize (20); 
      text ("you captured the", 320, 200);
      textSize (13); 
      text("click anywhere to play again", 180, 260);
    }
  }
}
