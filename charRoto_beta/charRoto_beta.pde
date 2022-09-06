/* 
- Schnappschuss speichern(.png) speichern = CONTROL + p (Vor dem ersten Benutzen Pfad anlegen)
- Letzte Eingabe wiederufen = CONTROL + z
- Alles weg pinseln = n CONTROL + n
- Hilfe = CONTROL + h
*/
import java.util.*;

String saveFormat = "png"; // <----------------------- Dateiformat
String myPath = ""; //<------------------------------- Dateipfad
//String myPath = "/Users/andi/Desktop/screenShots/";

String fileDate;
String helpText = "CONTROL + h = Hilfe zeigen / verbergen\nCONTROL + z = Letzte Eingabe löschen\nCONTROL + n = Alle Eingaben löschen\nCONTROL + p = Bild speichern";
boolean help;
PFont mainFont;
PFont courier;

int fSize;
int helpX;

float longSide;
float minFSize; float maxFSize;
int minAlpha; int maxAlpha;
int mySatur;
int myBright;
List<TextFrame> tFr = new ArrayList<TextFrame>(); 

color[] pSmith = {#000000,#465040,#C8D5BC,#EFD8D2,#FDB94B,#DF4C6C,#57324C,#57324C,#80A6AF,#469FA3,#F0EEDF};
color[] blues ={#000000, #2E5298, #332DFA, #29A27D, #9DFFB5, #465040, #57324C, #80A6AF, #469FA3, #FDB94B,#DF4C6C,#F0EEDF};
color[] webFavs ={#000000, #034f67, #e6e1dc, #77212e, #373434, #9B2335, #f9423a, #4244b6,#a6966c,#3e3d3d,#f0e68c};

/* ###################################################*/
/* ###################################################*/
/* ###################################################*/

void setup(){
  fullScreen();
  pixelDensity(1); // <--------------------------------- Pixel dichte 
  courier = createFont("Courier",100);
  mainFont = createFont("Luckiest Guy",200); //<-------- Schrift laden

  textAlign(CENTER,CENTER);
  colorMode(HSB,359,99,99,99);
  if(width > height){
    longSide = width;
  } else {
    longSide = height;
  }
fileDate = str(year()-2000) + str(month()) +str(day()) + "_";

help = false;

minFSize = 160;  // <-------------------------- Fontsize min
maxFSize = longSide *1.5; // <----------------- Fontsize max

mySatur = 76; // <---------------------------- Sättigung
myBright = 80; //<---------------------------- Helligkeit
minAlpha = 92; //<---------------------------- Transparenz min
maxAlpha = 99; //<---------------------------- Transparenz max

helpX = 0;  
}

/* ###################################################*/
/* ###################################################*/
/* ###################################################*/

void draw(){
  textAlign(CENTER,CENTER);
  rectMode(CORNER);
  background(webFavs[4]);
   for(int i = 0; i < tFr.size(); i++){  
   TextFrame textFr = tFr.get(i);
   textFr.show();   
  }
  
  if(help){
    helpX = 0;
  } else {
    helpX = - width;
  }
  
    fill(#000000,70);
    rect(helpX,30,width/2,height-60);
    fill(webFavs[6]);
    textAlign(LEFT,BASELINE);
    textFont(courier,width/70);
    text("Tastaturbefehle:",helpX +30,90);
    
    text(helpText ,helpX +30,140);
    text("mouseX = " + mouseX, helpX+30, (height/3)-30);
    text("mouseY = " + mouseY, helpX+30, (height/3));  
}
