/* 
Control + p = Bild Speichern
Control + n =  NEU :)
*/

float d = 20;

void setup(){
 // size(640, 480);
   fullScreen();
//   pixelDensity(2); // nutz die Höhere Pixeldichte von Displays 

  surface.setTitle("Paint a Pixel");
  background(240,240,200);
  cursor(CROSS);
}

void draw(){
  if(mousePressed){
    ellipse(mouseX,mouseY,d,d);
  }
}

void keyReleased(){
  if(int(key) == 16){
    saveFrame( "paintApixel-######.png");
  }
     if(int(key) == 14){ 
    background(240,240,200);
  }; 
}
