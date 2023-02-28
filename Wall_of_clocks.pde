color colour = color(255);
int r = 30;
int move_mode = 0; // 0 = least movement
                   // 1 = if hands dont move will force them to spin 360
                   // 2 = force all hands to spin at least 360
int wait = 30; //number of frames move animation lasts (0<wait<60 to avoid errors)
ArrayList<Digit> digits;
int[] time;

void mousePressed(){
  for(Digit d : digits){
    d.setDigit(-1); //force all digits to reset
                    //-1 will be overwritten with correct time before number is displayed
  }
}


void setup(){
  size(1800,400);
  digits = new ArrayList<Digit>();
  time = new int[6];
  for(int i=0; i<6; i++){
    Digit d = new Digit(50+(10*r*i),50);
    digits.add(d);
  }
  
}


void draw(){
  background(0);
  
  time[0] = floor(hour()/10);
  time[1] = hour()%10;
  time[2] = floor(minute()/10);
  time[3] = minute()%10;
  time[4] = floor(second()/10);
  time[5] = second()%10;
  
  digits.get(0).setDigit(time[0]);
  digits.get(1).setDigit(time[1]);
  digits.get(2).setDigit(time[2]);
  digits.get(3).setDigit(time[3]);
  digits.get(4).setDigit(time[4]);
  digits.get(5).setDigit(time[5]);

  printArray(time);
  
  for(Digit d : digits){
    d.show();
  }
  
  //colons
  stroke(colour,50);
  circle(590,140,20);
  circle(590,260,20);
  circle(1190,140,20);
  circle(1190,260,20);

  
}
