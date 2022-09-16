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
  PFont myF;
  TextFrame(String content_, PFont myF_, int fontSize_, float xPos_, float yPos_, float myAngle_,color myC_){
    content = content_;
    myF = myF_;
    fontSize = fontSize_;
    xPos = xPos_;
    yPos = yPos_;
    myAngle = myAngle_;
    myC = myC_;
  } 
  void show(){
    textAlign(LEFT,BASELINE);
    fill(myC);
    noStroke();
    textFont(myF,fontSize);
    pushMatrix();
    translate(xPos, yPos);
    rotate(myAngle);
    text(content,0,0);
    popMatrix();
  }
 
}
