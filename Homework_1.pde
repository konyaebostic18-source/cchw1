//Grid size
int gridSize = 50;

//shake intensity (black)
float shakeAmount = 3;

//Number of Circles (green/yellow)
int numCircles = 3;

//Circle Positions (green/yellow)
float[] greenX = new float[numCircles];
float[] greenY = new float[numCircles];
float[] yellowX = new float[numCircles];
float[] yellowY = new float[numCircles];

//Green and Yellow Circle Size
float circleSize = 50;

void setup() {
  size(300,500);
   
  //Initial Circle Postions
  for (int i = 0; i < numCircles; i++) {
    greenX[i] = random(circleSize, width - circleSize);
    greenY[i] = random(circleSize, height - circleSize);
    yellowX[i] = random(circleSize, width - circleSize);
    yellowY[i] = random(circleSize, height - circleSize);
}
}

void draw(){ 
  background (254, 243, 222);
  
  //Grid Reference
  noStroke();
  for (int x = 0; x < width; x += gridSize) {
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y += gridSize) {
    line(0, y, width, y);
  }
  
  //snap mouse to grid
  int snappedX = round(mouseX / (float)gridSize) * gridSize;
  int snappedY = round(mouseY / (float)gridSize) * gridSize;
  
  //circle at snaped position
  noFill();
  stroke(0);
  ellipse(snappedX, snappedY, gridSize * 4, gridSize * 4);
  
  //line Positions
  stroke(0);
  line(150, 50, 150, 500);
  line(100, 90, 250, 90);
  line(175, 95, 175, 425);
 line(90, 100, 90, 270);
 line(90, 400, 280, 400);
 line(220, 270, 220, 475);
 line(0, 100, 160, 100);
 line(30, 0, 30, 300);
 line(250, 175, 250, 300);
 
 //points
 point(120, 320);
 point(100, 120);
 
 //Mouse Pressed = Black circles Shake
 if (mousePressed && dist(mouseX, mouseY, 190, 180) < 1000) {
   float offsetX = random(-shakeAmount, shakeAmount);
   float offsetY = random(-shakeAmount, shakeAmount);
   fill(0);
   ellipse(190 + offsetX, 180 + offsetY, 100, 100);
   ellipse(175 + offsetX, 95 + offsetY, 30, 30);
   ellipse(190 + offsetX, 250 + offsetY, 10, 10);
   ellipse(100 + offsetX, 90 + offsetY, 5, 5);
   ellipse(250 + offsetX, 90 + offsetY, 5, 5);
   ellipse(150 + offsetX, 50 + offsetY, 5, 5);
   ellipse(220 + offsetX, 475 + offsetY, 5, 5);
   ellipse(280 + offsetX, 400 + offsetY, 5, 5);
   ellipse(0 + offsetX, 450 + offsetY, 150, 150);
   ellipse(175 + offsetX, 425 + offsetY, 5, 5);
   ellipse(90 + offsetX, 100 + offsetY, 5, 5);
   ellipse(90 + offsetX, 400 + offsetY, 5, 5);
   ellipse(275 + offsetX, 350 + offsetY, 80, 80);
   ellipse(30 + offsetX, 300 + offsetY, 5, 5);
 }

  // Initial black circles positions
  fill(0);
  circle(175, 95, 30);
  circle(190, 180, 100);
  circle(190, 250, 10);
  circle(100, 90, 5);
  circle(250, 90, 5);
  circle(90, 400, 5);
  circle(150, 50, 5);
  circle(220, 475, 5);
  circle(280, 400, 5);
  circle(175, 425, 5);
  circle(90, 100, 5);
  circle(0, 450, 150);
  circle(275, 350, 80);
  circle(30, 300, 5);
  
 //green circles positions
  noStroke();
  fill(0, 156, 147, 99);
  for(int i = 0; i < numCircles; i++) {
    ellipse(greenX[i], greenY[i], circleSize, circleSize);
  }
  
  //yellow circles positions
  noStroke();
  fill(255, 255, 0, 99);
  for (int i = 0; i < numCircles; i++){
    ellipse(yellowX[i], yellowY[i], circleSize, circleSize);
  }
}

void keyPressed() {
  if (key == '1') { 
    // Teleport yellow circles
    for (int i = 0; i < numCircles; i++) {
      yellowX[i] = random(circleSize, width - circleSize);
      yellowY[i] = random(circleSize, height - circleSize);
    }
  } else if (key == '2') { 
    // Teleport green circles
    for (int i = 0; i < numCircles; i++) {
      greenX[i] = random(circleSize, width - circleSize);
      greenY[i] = random(circleSize, height - circleSize);
    }
  }
}
