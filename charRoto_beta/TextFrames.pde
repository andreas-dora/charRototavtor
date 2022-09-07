class TextFrame{
  String content;
  float fSize;
  int fontSize;
  float xPos;
  float yPos;
  int myAlpha;
  float myAngle;
  float hue;
  color myC;
  TextFrame(String content_, int fontSize_, float xPos_, float yPos_, float myAngle_,color myC_){
    content = content_;
    fontSize = fontSize_;
    xPos = xPos_;
    yPos = yPos_;
    myAngle = myAngle_;
    myC = myC_;
  //  myAlpha = myAlpha_;
  } 
  void show(){

    fill(myC);
    noStroke();
    textFont(mainFont,fontSize);
    pushMatrix();
    translate(xPos, yPos);
    rotate(myAngle);
    text(content,0,0);
    popMatrix();
  }
 
}
