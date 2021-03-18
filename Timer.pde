class Timer{
  float Time;
  
  Timer(float set){
    Time = set;    
  }
  
  public float getTime(){  
          return  Time; 
    }
      
  public void setTime(float set){
    Time = set;
  }
  
  public void countUp(){
    Time += 1/frameRate;    
  }
  
  public void countDown(){    
    Time -= 1/frameRate;    
  } 
}
