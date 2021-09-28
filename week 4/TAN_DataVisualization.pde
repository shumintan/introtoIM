Table PeerBullying;

void setup () {
  size (1300, 800);
  PeerBullying = loadTable ("XLS_Bullying-database_July-2021.csv", "header");

  println (PeerBullying.getColumnCount()); // 4, this counts the total number of columns
  println (PeerBullying.getRowCount()); // 203, this counts the total number of rows

  println (PeerBullying.getString(10, 0)); // this pinpoints the text-based data
  println (PeerBullying.getFloat (10, 1)); // this points the interger-based data 

  textAlign(LEFT, CENTER);
  frameRate (1);
  noLoop ();
}

void draw () {
  background (255);

  for (int i=0; i< PeerBullying.getRowCount(); i++) { //draw a loop that will run through 203 rows of data
    if (PeerBullying.getFloat(i, 1)<20) {
      fill (0, 255, 0, 50);
    } else if (PeerBullying.getFloat(i, 1)<40) {
      fill (255, 255, 0, 50);
    } else if (PeerBullying.getFloat(i, 1)<60) {
      fill (255, 0, 0, 50);
    } else if (PeerBullying.getFloat(i, 1)<80) {
      fill (255, 0, 255, 50);
    }

    float x = random (0, 1300);
    float y = random (0, 750);

    ellipse (x, y, PeerBullying.getFloat(i, 1), PeerBullying.getFloat(i, 1));

    fill (0);
    textSize (10);
    text (PeerBullying.getString(i, 0), x, y);

    textSize (35);
    text ("PEER BULLYING, UNICEF JULY 2021", 500, 770);
  }
}
