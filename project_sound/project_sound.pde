import processing.sound.*;
SoundFile bass;
boolean play;

float x1;  //declaring line points
float y1;
float x2;
float y2;

int hue = 0; //rainbow effect

float movex = 8; //movement
float movey = 5;

float movex1 = 6;
float movey1 = 3;


void setup() {
  size(650, 500);
  background(0);
  colorMode(HSB); //changed colour mode from RGB to HSB

  bass = new SoundFile(this, "Bass.mp3");
  bass.loop();
  play = true;

  x1 = 0; //start from center
  y1 = 0;
  x2 = 0;
  y2 = 0;
}



void draw() {
  hue = (hue + 1) % 255; //increasing hue by 1 & bringing it back to 0 once it reaches 255

  translate(width/2, height/2);
  scale(abs(sin(millis()/1000.0)));

  //draw line
  stroke(hue, 255, 255);    //fade colours smoothly
  //fill(random(255),random(255),random(255));
  strokeWeight(3); 
  line(x1, y1, x2, y2);

  x1 += movex; //move lines
  y1 += movey;

  x2 -= movex1; //move opposite way
  y2 -= movey1;

  if (x1>=width/2 || x1<=-width/2) { //bounce of the canvas
    movex = movex *-1;
  }
  if (y1>=height/2 || y1<=-height/2) {
    movey = movey *-1;
  }

  if (x2>=width/2 || x2<=-width/2) { //bounce of the canvas
    movex1 = movex1 *-1;
  }
  if (y2>=height/2 || y2<=-height/2) {
    movey1 = movey1 *-1;
  }

  //draw circle
  //strokeWeight(50);
  fill(hue, 255, 255);
  circle(x1, y1, 15);
  circle(x2, y2, 15);
}
