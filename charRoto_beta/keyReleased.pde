void keyReleased(){
  if((int(key) > 32)&&(int(key) <300)){
    String myStr =str(key);
    int fontSize = (int)random(minFSize,maxFSize);
    float xPos = random(-fontSize/2,width+fontSize/2);
    float yPos = random(-fontSize/2, height+fontSize/2);
    float myAngle = random(0,TWO_PI);
    int myAlpha = (int)random(minAlpha,maxAlpha);
    color tempC; 
    int tempHue = (int)random(0,560); 
    if(tempHue > 500){
       tempC = #FCF5D9;
    } else if((tempHue >= 359)&&(tempHue<=459)){
      tempC = #000000;
    } else if((tempHue >= 460)&&(tempHue<=499)){
       tempC = #9F9EA0;
    } else {
     tempC = color(tempHue,80,70);
    }
    tFr.add(new TextFrame(myStr,fontSize, xPos, yPos, myAngle, tempC, myAlpha));
    println(tFr.size());  
  }
    if(int(key) == 16){
    saveFrame(myPath + fileDate + "randomChars-######."+saveFormat);
  }
  if((int(key) == 26)&&(tFr.size()>=1)){  
    int z = tFr.size()-1;
    tFr.remove(z);
    println(tFr.size()); 
  } 
  if((int(key) == 14)&&(tFr.size()>=1)){  
     for(int i = tFr.size()-1; i>= 0; i--){
       tFr.remove(i);
     }    
  }
  if(int(key) == 8){
    help = !help;
  }
}
