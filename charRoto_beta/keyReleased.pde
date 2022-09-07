void keyReleased(){
  if((int(key) > 32)&&(int(key) <300)&&(showMenu == false)){
    String myStr =str(key);
    int fontSize = (int)random(minFSize,maxFSize);
    float xPos = random(-fontSize/2,width+fontSize/2);
    float yPos = random(-fontSize/2, height+fontSize/2);
    float myAngle = random(0,TWO_PI);
    int myAlpha = (int)random(minAlpha,maxAlpha);
    color tempC; 
    int tempHue = (int)random(0,560); 
    int tempS = (int)random(minSat,maxSat);
    int tempBr = (int)random(minBr,maxBr);
    if(tempHue > 500){
       tempC = #FCF5D9;
    } else if((tempHue >= 359)&&(tempHue<=419)){
      tempC = #000000;
    } else if((tempHue >= 420)&&(tempHue<=499)){
       tempC = #9F9EA0;
    } else {
     tempC = color(tempHue,tempS,tempBr,myAlpha);
    }
    tFr.add(new TextFrame(myStr,fontSize, xPos, yPos, myAngle, tempC));
  }
    if(int(key) == 16){
      String fileDate = str(year()-2000) + str(month()) +str(day())+str(hour()) + "_";
    saveFrame(savePath + fileDate + "randomChars-######.jpg");
  }
    if(int(key) == 20){ // CONTROL +t
      String fileDate = str(year()-2000) + str(month()) +str(day())+str(hour()) + "_";
      saveFrame(savePath + fileDate + "randomChars-######.tif");
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
  if(int(key) == 13){
    showMenu = !showMenu;
  }
}
