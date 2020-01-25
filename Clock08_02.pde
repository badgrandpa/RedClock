/*
Bezier Clock
 
 I was really intregued by the bezier curve after last assignemnt, so 
 I decided to dive in a bit deeper and use this new challenge to implement
 beziers to tell time!
 
 I  took inspiration in a Sand Clock and how plesent and mesmerizing it 
 is to watch the tiny grians of sand trickle away. I wanted to create a 
 vizual piece that slowly generated and decomposed itself. enticing people
 to look at each curve progress just like you would a sand clock.
 
 In this particular Clock I used the first bezier for seconds, the second 
 for minutes and then a slow moving rectangle for hours. I also added an
 ADD blendmode and BLUR (new favorite thing) to investigate color variation 
 and experiment with the color pallet and how it affected the overall piece
 as it moved. 
 
 */


float speedS = 0; //speed value


// Gradient Variables for the background
int r = 200;
int b = 0;
int g = 40;
int gradientStroke = 3;
int gradientSpeed = 10;
float speed=0;


void setup() {
  size(500, 500);
  pixelDensity(2);
  smooth();


  // Gradient Background
  for (int i = 0; i < height; i++) {
    stroke(r, i, b);
    line(speed, i, width, i);

  }
}


void draw() {
  blendMode(ADD);
  filter(BLUR, 1);
  //blendMode(DIFFERENCE);
  // noLoop();


  // Time variables for seconds, minutes and hours. 
  float s = map(second(), 0, 60, 0, width);
  float m = map(minute(), 0, 60, 0, width);
  float h = map(hour(), 0, 24, 0, height);

  // seconds 
  
  //Animated bezier curve for seconds.
  fill(200, 0, 255, 10);
  //noStroke();
  stroke(random(0, 255));
  strokeWeight(1);
  bezier(250, 20, s, 100, s, 100, 250, 250);
  s = s + speedS;
  if (s > width || s < 0) {
    speedS = speedS * -1;
  }

  //Animated bezier curve for minutes.
  fill(0, 0, random(0, 255), 20);
  noStroke();
  stroke(random(0, 255));
  strokeWeight(1);
  bezier(250, 250, m, 250, m, 250, 250, 450);
  s = s + speedS;

  if (m > width || m < 0) {
    speedS = speedS * -1;
  }

  //Animated rect for hours.
  fill(random(0, 255), 0, 0, 10);
  //stroke(255);
  //strokeWeight(4);
  rect(h-268, width/h+17, 400, 500);
  //rect(0,h, 50, 50);
  h = h+ speedS;

  if (h > width || h < 0) {
    speedS = speedS * -1;
  }
}
