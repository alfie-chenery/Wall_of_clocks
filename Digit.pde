class Digit{
  ArrayList<Clock> clocks;
  PVector pos; //x,y of top corner clock's centre
  int digit;
  
  Digit(float X, float Y){
    pos = new PVector(X,Y);
    clocks = new ArrayList<Clock>();
    for(int j=0; j<6; j++){
      for(int i=0; i<4; i++){
         Clock c = new Clock(pos.x+(i*2*r),pos.y+(j*2*r));
         clocks.add(c);
      }
    }
    digit = -1; //force setDigit to pass
    setDigit(0); //start by displaying 0, will be overwritten before its actually displayed
  }
  
  void setDigit(int num){
    if(digit != num){ //only move if digit has changed
      digit = num;
      move(digit);
    }
  }
  
  void move(int num){
    float N = -HALF_PI;
    float E = 0;
    float S = HALF_PI;
    float W = PI;
    float X = PI-QUARTER_PI;
    
    float[] hands = new float[48];
    if(num==0){
      float[] positions = {E,S, E,W, E,W, S,W, N,S, E,S, S,W, N,S, N,S, N,S, N,S, N,S, N,S, N,S, N,S, N,S, N,S, N,E, N,W, N,S, N,E, E,W, E,W, N,W};
      arrayCopy(positions,hands);
    }else if(num==1){
      float[] positions = {E,S, E,W, S,W, X,X, N,E, S,W, N,S, X,X, X,X, N,S, N,S, X,X, X,X, N,S, N,S, X,X, E,S, N,W, N,E, S,W, N,E, E,W, E,W, N,W};
      arrayCopy(positions,hands);
    }else if(num==2){
      float[] positions = {E,S, E,W, E,W, S,W, N,E, E,W, S,W, N,S, E,S, E,W, N,W, N,S, N,S, E,S, E,W, N,W, N,S, N,E, E,W, S,W, N,E, E,W, E,W, N,W};
      arrayCopy(positions,hands);
    }else if(num==3){
      float[] positions = {E,S, E,W, E,W, S,W, N,E, E,W, S,W, N,S, E,S, E,W, N,W, N,S, N,E, E,W, S,W, N,S, E,S, E,W, N,W, N,S, N,E, E,W, E,W, N,W};
      arrayCopy(positions,hands);
    }else if(num==4){
      float[] positions = {E,S, S,W, E,S, S,W, N,S, N,S, N,S, N,S, N,S, N,E, N,W, N,S, N,E, E,W, S,W, N,S, X,X, X,X, N,S, N,S, X,X, X,X, N,E, N,W};
      arrayCopy(positions,hands);
    }else if(num==5){
      float[] positions = {E,S, E,W, E,W, S,W, N,S, E,S, E,W, N,W, N,S, N,E, E,W, S,W, N,E, E,W, S,W, N,S, E,S, E,W, N,W, N,S, N,E, E,W, E,W, N,W};
      arrayCopy(positions,hands);
    }else if(num==6){
      float[] positions = {E,S, E,W, E,W, S,W, N,S, E,S, E,W, N,W, N,S, N,E, E,W, S,W, N,S, E,S, S,W, N,S, N,S, N,E, N,W, N,S, N,E, E,W, E,W, N,W};
      arrayCopy(positions,hands);
    }else if(num==7){
      float[] positions = {E,S, E,W, E,W, S,W, N,E, E,W, S,W, N,S, X,X, X,X, N,S, N,S, X,X, X,X, N,S, N,S, X,X, X,X, N,S, N,S, X,X, X,X, N,E, N,W};
      arrayCopy(positions,hands);
    }else if(num==8){
      float[] positions = {E,S, E,W, E,W, S,W, N,S, E,S, S,W, N,S, N,S, N,E, N,W, N,S, N,S, E,S, S,W, N,S, N,S, N,E, N,W, N,S, N,E, E,W, E,W, N,W};
      arrayCopy(positions,hands);
    }else{ //9
      float[] positions = {E,S, E,W, E,W, S,W, N,S, E,S, S,W, N,S, N,S, N,E, N,W, N,S,  N,E, E,W, S,W, N,S,  E,S, E,W, N,W, N,S,  N,E, E,W, E,W, N,W}; 
      arrayCopy(positions,hands);
    }
    
    for(int i=0; i<2*clocks.size(); i+=2){
       clocks.get(i/2).setHands(hands[i],hands[i+1]);
    }
    
  }
  
  void show(){
    for(Clock c : clocks){
      c.show();
    }
  }
  
}
