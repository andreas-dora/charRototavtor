/*
CONTROL + n = Schrift neu setzen
CONTROL + p = Bild speichern
*/

String foxString = "the FoX is TiRED ";
PFont myF;
float x;
int y;
void setup(){
  size(1400,600);
  pixelDensity(2);
  myF = createFont("HelveticaNeue-Light",200);
  x = (width)/foxString.length();
   background(#93D6D0);
  textAlign(LEFT,CENTER);
  textFont(myF);
  fill(#E31717);
  
  for(int i = 0; i < foxString.length(); i++){
    y = (int)random(120,420);
    textSize((int)random(170,340));
    char ch = foxString.charAt(i);
    text(ch, x*i,y);
  }
}

void draw(){
}

void keyReleased(){
  if(int(key) == 16){
    saveFrame( "foxIs-######.png");
  }
  if(int(key) == 14){ 
      background(#93D6D0);
      for(int i = 0; i < foxString.length(); i++){
      y = (int)random(50,370);
      textSize((int)random(170,350));
      char ch = foxString.charAt(i);
      text(ch,x/2+x*i,y);
    }
  }
}
