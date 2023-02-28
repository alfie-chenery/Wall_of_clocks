class Clock{
  PVector c; //centre
  float hand1; //angle of hand
  float hand2;
  float hand1_new;
  float hand2_new;
  //float distance1;
  //float distance2;
  float speed1;
  float speed2;
  int animation;
  
  Clock(float X, float Y){
    c = new PVector(X,Y);
    hand1 = 0;
    hand2 = 0;
    hand1_new = 0;
    hand2_new = 0;
  }
 
  void setHands(float one, float two){
    //hand1 = hand1_new;
    //hand2 = hand2_new;
    hand1_new = one;
    hand2_new = two;
    
    float distance1 = hand1_new - hand1;
    float distance2 = hand2_new - hand2;
    
    if(move_mode == 1){
      if(distance1==0){
        distance1 = TWO_PI; 
      }
      
      if(distance2==0){
        distance2 = TWO_PI; 
      }
    }else if(move_mode == 2){
      distance1 += TWO_PI;
      distance2 += TWO_PI;
    } //if mode 0 make no change
    
    speed1 = distance1/wait;
    speed2 = distance2/wait;
    
    animation = 0;
  }
  
  void show(){
    //move hands if necessary
    if(animation<wait){
      hand1 += speed1;
      hand2 += speed2;
      animation++;
    }else{
      hand1 = hand1_new;
      hand2 = hand2_new; //ensure hands line up perfectly
    }
    
    //draw to screen
    noFill();
    stroke(colour,50);
    strokeWeight(3);
    circle(c.x,c.y,2*r);
    stroke(colour);
    line(c.x,c.y,c.x+r*cos(hand1),c.y+r*sin(hand1));
    line(c.x,c.y,c.x+r*cos(hand2),c.y+r*sin(hand2));

  }
  
}
