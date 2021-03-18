import processing.video.*;
import ddf.minim.*;


Timer songLength;
Timer songStart;

float [] beatTimes = new float[1000]; 
String [] beatTimes2; 
String[] rounded;

boolean startSong = false;
boolean end = false;

int songIndex = 0;

Minim minim;
AudioPlayer song;

public void setup(){
  minim = new Minim(this);
  song = minim.loadFile("song.mp3");
  songLength = new Timer(0);
  songStart = new Timer(3);
  size(500,500);
  frameRate(60);
  textSize(50);
  fill(0);    
}



public void draw(){
  background(255);
  
  if(songStart.getTime() > 0f){
  text(songStart.getTime(),200,200);
  songStart.countDown();
  }
  else{
    startSong = true;
  }
  
  if(startSong == true){
  text(songLength.getTime(), 100,100);
  songLength.countUp();
  song.play();
  }
    
  if(end == true){
    for(int counter = 0; counter < beatTimes.length; counter++){
      text(beatTimes[counter],250,250);
      saveFile();
    }    
  }  
}

public void keyPressed(){
    
  if(key == ' '){
    text("space",250,250);
    beatTimes[songIndex] = songLength.getTime();
    text(songLength.getTime(), 250,100);
    songIndex++;
    
  }
  
  if(keyCode == 8){    
   text("backspace",250,250);
  }
  
  if(keyCode == 20){
    text("capslock",250,250);
  }
  
  if(keyCode == 10){
     beatTimes[songIndex] = songLength.getTime();
    text("enter",250,250);
    songIndex++;
  }
  
  if(keyCode == 16){
    text("shiftin",250,250);
  }
  if(keyCode == 17){
    text("shiftout",250,250);
  }
    
   if(key == 'p'){
     end = true;
     startSong = false;
     
   }   
}
    private void roundOff(){
       beatTimes2 = new String[beatTimes.length];
       rounded = new String[beatTimes2.length];
    for(int counter = 0; counter < beatTimes.length;counter++){
      beatTimes2[counter] = str(beatTimes[counter]);
    }
    for(int counter = 0;counter < songIndex;counter++){      
      rounded[counter] = beatTimes2[counter].substring(0,beatTimes2[counter].indexOf('.') + 4);      
    }
    }
      
  public void saveFile(){
    roundOff();   
    saveStrings("3.txt",rounded);
    exit(); 
  }
  
