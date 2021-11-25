class Timer {
  float Time ;
  
  //Constructor 
  Timer (float set) { 
   Time = set;
  }
  float getTime () { // returns the current time 
    return(Time);  
  }
  void setTime (float set) { // set the timer to whatever you put as temporary varibale, ie. 30 seconds
   Time = set;
  }
  void countDown () {
  Time -= 1/ frameRate; 
  }
}
