import processing.serial.*;

int fgcolor;          
Serial Port;                       // The serial port
int[] serialInArray = new int[5];    // Where we'll put what we receive
int serialCount = 0;                 // A count of how many bytes we receive
float location, gravity, lifespan; 
float fireworkFill;
boolean firstContact = false;        // Whether we've heard from the microcontroller


import processing.video.*;
Capture video;
int locX, locY;
//PImage prevFrame;
float r1, g1, b1;
//float red;
//float green;
//float blue
float particleColor;


import processing.sound.*;
SoundFile firecrackers;


ArrayList<Firework> fireworks;
//PVector gravity = new PVector(0, 0.1); // !!!!!! i want to manipulate this gravity 

void setup() {
  size(1200, 700);
  video = new Capture (this, 1200, 700);
  video.start();

  fireworks = new ArrayList<Firework>();

  String portName = Serial.list()[2];
  Port = new Serial(this, portName, 9600);
  //Port.clear();
  //Port.bufferUntil ('\n');

  firecrackers = new SoundFile (this, "FireworksSingle.mp3");
}

void draw() {
  background(35, 27, 107);
  // colorChange();
  if (random(1) < 0.08) {
    fireworks.add(new Firework());
  }

  for (int i = fireworks.size()-1; i >= 0; i--) {
    Firework f = fireworks.get(i);
    f.run();

    if (f.done()) {
      fireworks.remove(i);
    }
  }
  //filter (BLUR, 1);
}

void keyPressed () {
  if (key == ' ') {
    saveFrame();
  }
}

void serialEvent(Serial myPort) {
  //String smyPort = myPort.readStringUntil ('\n');
  //println("here!!");
  //println("printing here: ", smyPort);
  //    smyPort=trim(smyPort);
  //    if (smyPort!= null) {
  //      int values [] = int (split (smyPort, ','));
  //      if (values.length==5) {
  //        println(values);
  //      }
  //    }
  int inByte = myPort.read();

  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      myPort.write('A');       // ask for more
    }
  } else {
    serialInArray[serialCount] = inByte;
    //println(serialInArray);

    //String smyPort = myPort.readStringUntil ('\n');
    //smyPort=trim(smyPort);
    //if (smyPort!= null) {
    //  int values [] = int (split (smyPort, ','));
    //  if (values.length==5) {
    //    println(values);
    //  }

    serialCount++; //1, 2, 3 [0, 1, 2]

    if (serialCount > 2 ) {
      location = serialInArray[0];
      lifespan = serialInArray[1];
      fireworkFill = serialInArray[2];
      // lifespan = serialInArray[3];

      for (int i = fireworks.size()-1; i >= 0; i--) {
        Firework f = fireworks.get(i);

        //float grav = gravity;
        //f.gravity = new PVector (0, grav); 

        ArrayList <Particle> particle = f.particles;

        for (int j = particle.size()-1; j >= 0; j--) {
          Particle p = particle.get(j);
          PVector loc = new PVector(location, location);
          p.location.add(loc);

          //PVector speed = new PVector (velocity, velocity); 
          //p.velocity.add(speed);

          p.particleFill = fireworkFill;

          //p.velocity = velocity;
          //p.acceleration = acceleration;

          p.lifespan = lifespan;
        }
      }
      // println(location + "\t" + gravity + "\t" + fireworkFill + "\t");

      // Send a capital A to request new sensor readings:
      myPort.write('A');
      serialCount = 0;
    }
  }
}

class Firework {

  ArrayList<Particle> particles;    
  Particle firework;
  float hu;
  PVector gravity;

  Firework() {
    hu = random(255);
    firework = new Particle(random(width), height, hu);
    particles = new ArrayList<Particle>();
    gravity = new PVector (0, 0.1);
  }

  boolean done() {
    if (firework == null && particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

  void run() {
    if (firework != null) {
      //fill(hu, 255, 255);
      firework.applyForce(gravity);
      firework.update();
      firework.display();

      if (firework.explode()) {
        firecrackers.play();
        for (int i = 0; i < 100; i++) {
          particles.add(new Particle(firework.location, hu));
        }
        firework = null;
        // firecrackers.stop();
      }
    }

    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.applyForce(gravity);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }


  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }
}
class Particle {
  //Constructor 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float particleFill;
  float particleColor;
  float r1, g1, b1;

  boolean seed = false;

  float hu;

  Particle(float x, float y, float h) {
    hu = h;

    acceleration = new PVector(0, 0);
    velocity = new PVector(0, random(-10, -5));
    location =  new PVector(x, y);
    seed = true;
    lifespan = 255.0;
    particleFill = 4;
    particleColor = 0;
  }

  Particle(PVector l, float h) {
    hu = h;
    acceleration = new PVector(0, 0);
    velocity = PVector.random2D();
    velocity.mult(random(-5, 5));
    location = l.copy();
    lifespan = 300;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void run() {
    update();
    display();
    //colorChange();
  }

  boolean explode() {
    if (seed && velocity.y > 0) {
      lifespan = 0;
      return true;
    }
    return false;
  }

  void update() {

    velocity.add(acceleration);
    location.add(velocity);
    if (!seed) {
      lifespan -= 5.0;
      velocity.mult(0.95);
    }
    acceleration.mult(0);
  }

  void display() {
    if (video.available()) {
      println ("here"); 
      video.read();
      //}
      video.loadPixels();
      loadPixels();

      //red=0;
      //green=0;
      //blue=0;

      for (int y=0; y<height; y++) {

        for (int x=0; x<width; x++) {
          int loc = (video.width-x-1)+(y*width);
          color pix=video.pixels[loc];
          float r1=red(pix);
          float g1=green(pix);
          float b1=blue(pix);

          //red = red+r1; 
          //green = green+g1; 
          //blue = blue+b1;

          if ((x == int (width/2)) && (y == int (height/2))) {
            println (r1, g1, b1);
            stroke (r1, g1, b1, 500);
            // colorMode (RGB);
            //  println (red, green, blue);
          }
        }
      }
    }

    //  fill(r1, g1, b1);

    if (seed) {
      strokeWeight (particleFill);
    } else {
      strokeWeight (particleFill);
    }
    point(location.x, location.y);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
