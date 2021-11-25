import processing.serial.*;

Serial myPort;       
float inByte = 0;

Raindrop [] raindrops; 
int totalDrops = 0;

Timer startTimer;

void setup () {
  size(400, 300);

  //for the Port
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');

  //for the Bucket
  bucket = loadImage ("Bucket.png");
  bucket.resize (50, 0);
  
  raindrops = new Raindrop [100];
}

void draw () {
  background(0);
  image (bucket, inByte, 400);
  
  for (int i=0; i < totalDrops; i++) {
    raindrops[i].move();
    raindrops[i].display();
    if (bucket.intersect(raindrops[i])) {
      raindrops[i].caught();
    }
  }
}

void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to a float
    inByte = float(inString);
    // map to the width of the screen
    inByte = map(inByte, 0, 1023, 0, width);
    println(inByte);
  }
}
