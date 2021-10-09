
boolean autoPom = false;
boolean dropPom = false;
boolean moduloPom = false; 

float dropX = 0;
float dropY = 0;
float dropW = 0;

void setup() {
  //size(1000, 1000);
  fullScreen();

  background(255);
  drawInstructions();

  dropX = 0;
  dropY = height;
  dropW = width;
}


void draw() {
  
  if (moduloPom) {
    
  }

  if (autoPom) {
    drawPomPom(width/2 + random(-width/4, width/4), height/2 + random(-height/4, height/4));
  }

  if (dropPom) {

    dropX += random(25, 50);

    if (dropX > width/2 + dropW/2) {
      dropX = width/2 - dropW/2;
      dropY -= random(50, 100);
      dropW -= random(100, 200);
    }

    if (dropW < 50) {
      dropX = 0;
      dropY = height;
      dropW = width;
      dropPom = false;
    }

    drawPomPom(random(width/2-dropW/2, width/2+dropW/2), dropY);
  }
}


void mousePressed() {
  drawPomPom(mouseX, mouseY);
}

void keyPressed() {

  if (key == 'e') { 
    background(200);
    drawInstructions();
  } else if (key == 'a') {
    autoPom = !autoPom;
  } else if (key == 'd') {
    dropPom = !dropPom;
  } else if (key == ' ') {
   drawPomPom(random(width), random(height));
  } else if (key == 'm') {
   moduloPom = !moduloPom;
  }
}


void drawPomPom(float x, float y) {

  float r = random(110, 220);
  float g = random(110, 220);
  float b = random(110, 220);

  float pompomsize = random(50, 100);
  float woolWeight = random(1, 3);

  float bend = pompomsize * random(0.25, 0.75);

  int loops = int(random(750, 2000));

  for (int n = loops; n > 0; n--) {

    float woolLength = pompomsize * n/loops;
    float woolAngle =  random(-360, 360); 

    stroke(r+random(-20, 20), g+random(-20, 20), b+random(-20, 20), 225);
    strokeWeight((random(woolWeight, woolWeight+3)));
    strokeCap(ROUND);
    noFill();

    // straight line version 
    //line(x, y, x+cos(woolAngle)*woolLength, y+sin(woolAngle)*woolLength);

    float x2 = x+cos(woolAngle)*woolLength;
    float y2 = y+sin(woolAngle)*woolLength;
    curve(x+random(-bend, bend), y+random(-bend, bend), x, y, x2, y2, x2+random(-bend, bend), y2+random(-bend, bend));
  }
}

void drawInstructions() {

  // this function draws the instructions on the screen
  // I've put it in a function because I needed to use it twice! (setup and clear screen)
  // better to do this than copy and paste code

  // put some instructions on screen
  fill(255);
  textSize(20);
  text("PomPom Paint v0.1\n-----------------\nclick mouse to place pom-pom\npress d to drop pom poms into a pile\npress spacebar to erase", 20, 40);
}
