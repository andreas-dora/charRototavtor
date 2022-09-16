/* 
CHAR Rotovator.beta by Andreas Breitwieser 2022
- CONTROL + 'p' : .jpg Speichern (Vor dem ersten Benutzen Pfad anlegen),
- CONTROL + 't' : . tif Speichern
- CONTROL + 'z' : letzte Eingabe wiederufen
- CONTROL + 'n' : Alles weg pinseln
- CONTROL + 'm' : Menu öffenen/schließen
*/
import java.util.*;
color[] pSmith = {#000000,#465040,#C8D5BC,#EFD8D2,#FDB94B,#DF4C6C,#57324C,#57324C,#80A6AF,#469FA3,#F0EEDF};
color[] blues ={#000000, #2E5298, #332DFA, #29A27D, #9DFFB5, #465040, #57324C, #80A6AF, #469FA3, #FDB94B,#DF4C6C,#F0EEDF};
color[] backC ={#000000, #034f67, #e6e1dc, #77212e, #373434, #9B2335, #f9423a, #4244b6,#a6966c,#3e3d3d,#f0e68c};
PFont mainFont;
PFont courier;
PFont activeF;

int offset = 8;
//int helpX;
float menuX = 0.0;
float menuW;

float menuRow, mW, m3rd, m6th;
float mRow1, mRow2, mRow3, mRow4, mRow5; 

float longSide;
boolean showMenu = true;

// ###########################################
// ###########################################
// ###########################################

JSONObject preSet;
JSONObject fontSet;
JSONObject colorSet;
String savePath = "";
String fString ="";
String sampleStr="";
int fSize; 

float minFSize,maxFSize;
boolean isRandom = true;
int minSat, maxSat;
int minBr, maxBr; 
int minAlpha, maxAlpha;
int bC;

// ###########################################
// ###########################################
// ###########################################
Btn[] btn= new Btn[1];
Btn[] fBtn = new Btn[4];
Btn[] cBtn = new Btn[14];
Input[] input = new Input[3];

String helpText = "CONTROL + h = Hilfe zeigen / verbergen\nCONTROL + z = Letzte Eingabe löschen\nCONTROL + n = Alle Eingaben löschen\nCONTROL + p = Bild speichern";
List<TextFrame> tFr = new ArrayList<TextFrame>(); 


/* ###################################################*/
/* ###################################################*/
/* ###################################################*/

void setup(){
  fullScreen();
  pixelDensity(2); // <--------------------------------- Pixel dichte 
  loadPreJSON();
  courier = createFont("Courier",100);
  mainFont = createFont(fString,fSize);

  //mainFont = createFont("Luckiest Guy",200); //<-------- Schrift laden

  textAlign(CENTER,CENTER);
  colorMode(HSB,359,99,99,99);
  if(width > height){
    longSide = width;
  } else {
    longSide = height;
  }


//help = false;
 menuW = width/3;
  mW = menuW - offset*2;
  m3rd = (mW - (offset*2))/3;
  m6th = (m3rd-offset)/2;
  menuRow  = (height-2 *offset)/6;
  mRow1 = offset;
  mRow2 =menuRow*1+offset;
  mRow4 = menuRow*4+offset;
  mRow5 = menuRow*5+offset;
  println("menuW: " + menuW + "    menuRow: " + menuRow); 
  input[0] =new Input(fString, offset*2, 40, 260, 36);
    input[1] =new Input(sampleStr, offset*2, 380, 350, 140);
    input[2] =new Input(savePath, offset*2, 855, 450, 32);

  btn[0] = new Btn("x", menuX + 434, 8, 40,30);
  
  fBtn[0] = new Btn("+",14, 200, 60,24); // minSat +
  fBtn[1] = new Btn("-",14, 278, 60,24);// minSat -
  fBtn[2] = new Btn("+",92, 200, 60,24); // maxSat +
  fBtn[3] = new Btn("-",92, 278, 60,24); // maxSat -
  
  
  cBtn[0] = new Btn("+",14, 642, 60,24); // minSat +
  cBtn[1] = new Btn("-",14, 720, 60,24);// minSat -
  cBtn[2] = new Btn("+",92, 642, 60,24); // maxSat +
  cBtn[3] = new Btn("-",92, 720, 60,24); // maxSat -
 
  cBtn[4] = new Btn("+",170, 642, 60,24); // minBr +
  cBtn[5] = new Btn("-",170, 720, 60,24);// minBr -
  cBtn[6] = new Btn("+",250, 642, 60,24); // maxBr +
  cBtn[7] = new Btn("-",250, 720, 60,24); // maxBr -
  
  cBtn[8] = new Btn("+",328, 642, 60,24); // minBr +
  cBtn[9] = new Btn("-",328, 720, 60,24);// minBr -
  cBtn[10] = new Btn("+",406, 642, 60,24); // maxBr +
  cBtn[11] = new Btn("-",406, 720, 60,24); // maxBr -
  
 cBtn[12] = new Btn("-",320, 200, 60,24); // minSat +  
 cBtn[13] = new Btn("+",400, 200, 60,24);// minSat -

activeF = courier;


tFr.add(new TextFrame("SHORTcuts",activeF,90, 500, 150, 0, #CBA404));

tFr.add(new TextFrame("CONTROL + t: save tif",activeF,40, 500, 204, 0, backC[0]));
tFr.add(new TextFrame("CONTROL + p: save jpg",activeF,40, 500, 252, 0, backC[0]));
tFr.add(new TextFrame("CONTROL + n: clear Screeen",activeF,40, 500, 300, 0, backC[0]));
tFr.add(new TextFrame("CONTROL + m: open Menu",activeF,40, 500, 346, 0, backC[0]));
// helpX = 0;  4
 showMenu = true;

activeF = mainFont;
}

/* ###################################################*/
/* ###################################################*/
/* ###################################################*/

void draw(){
    background(backC[bC]);
    for(int i = 0; i < tFr.size(); i++){  
   TextFrame textFr = tFr.get(i);
   textFr.show();   
  }
    textAlign(LEFT,BASELINE);
    //  text("sampleStr: \n" + sampleStr,width/3+80,80,800,800);

  rectMode(CORNER);
  

  
  
  fill(#A0A0A0,78);
 // rect(menuX, offset, menuW, height-2*offset);
  
 // fill(#000000,70);
 // rect(menuX +offset*2,200,66,40);
  fill(#ffffff);
 // rect(menuX +offset*2,200,60,34);
 // rect(menuX +offset*2,234,60,40);
 // rect(menuX +offset*2,274,60,34);
  
  fill(backC[3]);
 
  textFont(courier,30);
 // text(str(minAlpha),menuX +offset*2,234,60,40);


for(int i = 0; i < 6; i++){
  rect(menuX+offset, offset+i*((height - 2*offset)/6), menuW-2*offset,(height - 2*offset)/6);
  }
  fill(#47B498,80);
//  rect(menuX+offset,mRow4,mW,menuRow);
   
  fill(#3C0067);
  // rect(menuX+offset,mRow5,mW,menuRow);
  rect(menuX+offset,offset,mW,menuRow);
  rect(menuX+offset,mRow4,m3rd,menuRow);
  rect(menuX+2*offset+m3rd,mRow4,m3rd,menuRow);
  rect(menuX+3*offset+m3rd*2,mRow4,m3rd,menuRow);

  textFont(courier,16);
  fill(#F7B200);
  textAlign(LEFT,TOP);
  text("Main Font",menuX+offset*2,offset*2);
  textAlign(CENTER,CENTER);
   text("Fontsize:",menuX+offset+m3rd/2,mRow2+offset);
   
  text("min",menuX+2*offset+(m6th-offset)/2,mRow2+26);
  text("max",menuX+2*offset+(m6th)*1.5,mRow2+26);
  
  text("SATURATION",menuX+offset+m3rd/2,mRow4+offset/2);
  text("min",menuX+2*offset+(m6th-offset)/2,mRow4+26);
  text("max",menuX+2*offset+(m6th)*1.5,mRow4+26);

  text("Brightness",menuX+offset*2+m3rd*1.5,mRow4+offset/2);
  text("min",menuX+2*offset+m3rd*1.5-(m6th-offset)/2,mRow4+26);
    text("max",menuX+2*offset+m3rd*1.5+m6th/2,mRow4+26);

  text("Alpha",menuX+offset*2+m3rd*2.5,mRow4+offset/2);
  text("min",menuX+2*offset+m3rd*2.5-(m6th-offset)/2,mRow4+26);
  text("max",menuX+2*offset+m3rd*2.5+m6th/2,mRow4+26);

  text("BACKGROUND",menuX+offset*2+m3rd*2.5,mRow2+offset*2);

  textAlign(CENTER,TOP);
  text(nf((int)minFSize,3),menuX+30,mRow2+90);
  text(nf((int)maxFSize,4),menuX+120,mRow2+90);
  textFont(courier,34);
  text(nf(minSat,2),menuX+30,678);
  text(nf(maxSat,2),menuX+120,678);
  text(nf(minBr,2),menuX+200,678);
  text(nf(maxBr,2),menuX+280,678);
  text(nf(minAlpha,2),menuX+350,678);
  text(nf(maxAlpha,2),menuX+430,678);
  
  if((showMenu)&&(mousePressed)){
     for(int i = 0; i < fBtn.length; i++){
     if(fBtn[i].mouseOver(mouseX, mouseY)){    
       switch(i){
         case 0:
          if(minFSize <maxFSize){
           minFSize +=2;
         }
         break;
         case 1:
         if(minFSize >0){
           minFSize -=2;
         }
         break;
         case 2:
         maxFSize +=8;
         break;
         case 3:
         if(maxFSize > minFSize){
           maxFSize -=8;
         }
         break;
       }
     }
    } 
  }

 for(int i =0; i <btn.length; i++){
   btn[i].display(mouseX,mouseY);
   }
 for(int i =0; i <fBtn.length; i++){
   fBtn[i].display(mouseX,mouseY);
   }        

 for(int i =0; i <cBtn.length; i++){
   cBtn[i].display(mouseX,mouseY);
   }     
   
 for(int i = 0; i < input.length;i++){
   input[i].display(mouseX,mouseY);
 }  
  if(!showMenu){
    if(menuX > -500){
      menuX-=5  ;}
  } else {
    menuX =0; 
}
  
    fill(#000000,70);
  //  rect(helpX,30,width/2,height-60);
    fill(backC[6]);
    textAlign(LEFT,BASELINE);
    textFont(courier,width/70);
}
