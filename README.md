title:charRotoSettings
author:Andreas Breitwieser
date:25.08.22

![](img/kommata_m.png)

# charRotovator 4EDi


Um den rohen Code ausführen zu können brauchst du die kostenlose [Processing App](https://processing.org/download) und natürlich den Code von meiner [Github Seite](https://github.com/andreas-dora/charRotovator). Klick auf **CODE** und dann **Download Zip**.  Die Dateien können auch mit Git über die Konsole geladen werden: 

`git clone https://github.com/andreas-dora/charRotovator.git`

Das Programm-Paket enthält die App **charRoto_beta** und einen Ordner mit weiteren Beispielen. Die App besitzt derzeit noch kein User-Interface. Einige Voreinstellung sind also noch per Hand im Code einzutragen. Unter den folgenden Links findest Du eine Beschreibung aller Voreinstellungen sowie eine Übersicht der Tastatur-Befehle. Außerdem    

 
--- 



## Links 

- [Download Processing](https://processing.org/download) 
- [Git auf dem Mac einrichten](https://www.youtube.com/watch?v=_sLgRBrZh6o&t=168s)

 ---
 
# Grundlagen

#### Processing Sprache und App

Processing wurde 2001 von Casey Reas und Benjamin Frey auf Basis der Programmiersprache Java entwickelt. Processing sollte Gestaltern einen leichten Zugang zum Programmieren erleichtern. Dafür haben die Entwickler Java ein wenig abgekürzte und leistungsstarke Funktionen für das Arbeiten mit Bild und Ton implementiert. Vieles von dem was Processing kann ist mittlerweile auch über HTML, CSS und Javascript im Browser möglich. Bei rechenintensiveren Aufgaben ist Processing allerdings nach wie vor klar im Vorteil.

Die Processing App ist eine komplette Entwicklungsumgebung, zum Schreiben und Ausführen des Codes. Eine Exportfunktion erstellt aus fertigem Code eigenständige Programme.  

 In Processing wird ein Programm **Sketch**  genannt. Dementsprechend findest Du in der App Menüpunkte wie **Sketch starten** und **Sketch archivieren**. Deine Dateien werden im  Ordner **Sketchbook** gespeichert. 

Ein Sketch kann aus mehreren Dateien bestehen. Jeder Sketch wird in einem gleichnamigen Ordner gespeichert. 
In der Processing App findest Du im Menüpunkt **Tootls** die Funktion **Sketch archivieren**. Der Sketch wird als Zip-Datei im jeweiligen Sketch-Ordner gespeichert.  Das ist sehr praktisch falls man sich mal etwas kaputt schreibt.

In der App findest Du unter dem Menüpunkt **Datei** recht große Auswahl von **Bespielen** zu verschiedenen Themen.

---
 
## Schreibweise
 
 ```
float x = 200;
float y;
int r = 50;
float xSpeed = 2.4;

void setup(){ 
  size(640, 360); 
  y = height / 2;
}

void draw(){
  background(0, 100, 200);
  fill(255, 200, 50);
  ellipse(x, y, 100, 100);
  x = x + xSpeed;
  if ( x > width  + r){
    x = - r;
  }
}
```
 
 
#### Groß- und Kleinschreibung

Groß- und Kleinschreibung sind genau zu beachten. Der Wert einer Variable klein `y` kann nicht mit groß `Y` abgerufen werden.  

---

#### Semikolon 

Jede Anweisung wird mit einem Semikolon beendet. 

```
  background(0, 100, 200);
  fill(255, 200, 50);
  ellipse(x, y, 100, 100);
  ```
  
 ---

#### Kommata 
Kommata trennen Werte. Die Funktion `size(640,360);` erzeugt ein Programmfenster mit 640 Pixeln breite und 360 Pixeln höhe. 
Komma-Zahlen werden dem englischen Begriff und der Schreibweise entsprechend als **Floating Point Numbers** mit einem Punkt als Trennzeichen geschrieben: `float xSpeed = 2.4;`

---

#### Einrückungen
Einrückungen sogenannte Indentations haben in Java und damit auch Processing keinen Einfluss auf das Programm. Einrückungen, Leerzeichen und Zeilenumbrüche dienen ausschließlich der besseren Lesbarkeit. Der oben stehende Code könnte auch so zusammen gefasst werden:

```
float x=200;float y;int r=50;float xSpeed=2.4;
void setup(){size(640,360);y=height/2;}
void draw(){background(0,100,200);fill(255,200,50);ellipse(x,y,2*r,2*r);
x =x+xSpeed;if(x>width+r){x=-r;}}
```

---


#### Kommentare 

Kommentare sind Teile des Codes die nicht ausgeführt werden. Mit Kommentaren können Erklärungen und Informationen hinterlassen werden.
Kommentare ermöglichen 
Außerdem ermöglichen Kommentare Veränderungen im Code ausprobieren ohne, dass man etwas löschen muss.
Zwischen `/*`und `*/` werden mehrzeilige Kommentare gesetzt.
`//`Doppel-Slash Kommentiert bis zum nächsten Zeilenumbruch aus. Es wird lediglich der Teil Hinter dem Doppel-Slash ignoriert: `int r = 50; // r = Radius` 

```
/* 
Die neue If-Bedingung 
lässt den Ball abprallen 
und wieder umkehren 
*/

float x = 200;
float y;
int r = 50; // r = Radius
float xSpeed = 2.4;
  
void setup(){
//  size(360,640);
  size(640,360); 
  y = height / 2;
}

void draw(){
  background(0, 100, 200);
  noStroke();
  fill(255, 200, 50);
  ellipse(x,y,r*2,r*2);
  x = x +xSpeed;
 /*
  if(x > width+r){
    x = -r;
  }
  */
  if((x >= width - r) || (x < 0 + r)){
    xSpeed = xSpeed * -1;
  }
}
```

--- 
  
  
  
# Voreinstellungen


### Dateiformat 

Bevor Du loslegen kannst sollten ein paar Voreinstellungen gemacht werden. In der aktuellen Version besteht das Programm aus drei Dateien, in in der Processing App als drei Tabs dargestellt werden. 
Der erste Tab heißt genau so, wie die aktuelle Version des Programms. Alle Voreinstellung sind hier zu erledigen. 
Zu Beginn tauchen zwei Zeilen auf: 

```
String saveFormat = "png";
String myPath = "";
```
Die Zeile **saveFormat** gibt das Dateiformat für die einfache Bildspeicherung **saveFrame()** vor. Neben 'png' sind 'tif', 'tga' und 'jpg' möglich. 

---

### Speicherpfad 

In der Zeile **myPath** gibst Du an, wo deine Bilder gespeichert werden sollen. Bleibt Die Zeile leer werden Bilder direkt neben den Programmdateien gespeichert. Bei einem Update des Programmordners würden sie dort verloren gehen. Dateipfade werden in Anführungszeichen angegeben.
 
```
String myPath = "/Users/andi/Desktop/screenShots/"; 
```

Auf dem Mac kannst Du mit Hilfe der **Terminal App** ganz einfach einen Dateipfad ermitteln. Die App findest Du unter Programme -> Andere.  
Du brauchst nur den gewünschten Ordner auf die Terminal App zu ziehen schon bekommst Du den Pfad ausgegeben. 


----

### Bildschirmauflösung 

Weiter gehts es etwa bei Zeile 30, innerhalb der Setup-Funktion.  

```
pixelDensity(1);
```

Bei der Benutzung eines hochauflösenden Displays wie kann **pixelDensity** auf **2** gesetzt werden. Bei werden einem 13" Macbook werden so vom Bildschirm Dateien mit 2880 x 1800 Pixeln gerendert.

--- 

### Font laden

```
mainFont = createFont("HelveticaNeue-Light",200);
```

Hier kann nun ein Wunsch-Font geladen werden. Die Funktion **createFont()** erwartet neben dem Dateiname auf jeden Fall auch eine Größe. Dateinamen werden wie Pfade in Anführungszeichen gesetzt. 


![](img/courierH.png)

`
 
