class TextFrame{
  String content;
  float fSize;
  int fontSize;
  float xPos;
  float yPos;
  int myAlpha;
  float myAngle;
  float hue; 
  TextFrame(String content_, int fontSize_, float xPos_, float yPos_, float myAngle_, int myAlpha_){
    content = content_;
    fontSize = fontSize_;
    xPos = xPos_;
    yPos = yPos_;
    myAngle = myAngle_;
  //  fSize = int(random(width/8,width));
   hue  = random((int)random(0,700)); 
   println(hue);
    myAlpha = myAlpha_;
  }
  void show(){
    if(hue > 500){
      fill(#FCF5D9);
    } else if((hue >= 359)&&(hue<=420)){
    //  println("Bingo Black");
      fill(#000000);
    } else {
      fill(hue,mySatur,myBright,myAlpha);
    }
    noStroke();
    textFont(mainFont,fontSize);
    pushMatrix();
    translate(xPos, yPos);
    rotate(myAngle);
    text(content,0,0);
    popMatrix();
  }
 
}
