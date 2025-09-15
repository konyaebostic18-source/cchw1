# cchw1
homework 1

![40cb6273f73eefe3ea3b62f7e9ab1808](https://github.com/user-attachments/assets/18b27bb0-7dda-44d6-94d8-e586af6c8d2e)

For this project, I referenced a piece of art that I saw online. I wanted it to incorporate a lot of lines, along with a mixture of black, green, yellow, and noFill circles. 

For my interactive elements, I wanted to make the black circles shake with mousePressed and have the green and yellow circles move randomly with keyPressed. For the mousePressed function, first, I created an int variable named “shakeAmount” and set it to 3. Then, I created an if conditional: 

if (mousePressed && dist(mouseX, mouseY, 190, 180) < 1000) {
   float offsetX = random(-shakeAmount, shakeAmount);
   float offsetY = random(-shakeAmount, shakeAmount);

This code states that if the mouse is pressed at least 1000 pixels near the point (190, 180). Then it will generate random offsets in the x and y directions by 3 pixels. I set it to 1000 so that no matter where you click, the circles will shake. Underneath this code, I put the positions of all the black circles, so that all of them will have the same effect. I also put the initial black circle positions. 

Next for my keyPressed interactions, I made it so that when the 1 key is pressed, the yellow circles will move, and then 2 key is pressed, the green circles move. 

First, I created an int variable named numCircles and set it to 3. This way, I can apply functions to all circles at once. I then created the following float functions for the circle positions: 

float[ ] greenX = new float[numCircles];
float[ ] greenY = new float[numCircles];
float[ ] yellowX = new float[numCircles];
float[ ]  yellowY = new float[numCircles];

This code allows the greenX and greenY to store the X and Y positions of all green circles, same going for the yellowX and yellowY. Next, I created a for loop in order to randomly generate the initial positions of the green and yellow circles:

 for (int i = 0; i < numCircles; i++) {
    greenX[i] = random(circleSize, width - circleSize);
    greenY[i] = random(circleSize, height - circleSize);
    yellowX[i] = random(circleSize, width - circleSize);
    yellowY[i] = random(circleSize, height - circleSize);

This code allows for the circles to generate in random positions each time the canvas is opened. For every circle, it picks a random X and Y coordinate within the canvas, while also making sure the circle stays fully on screen by keeping it at least one circle’s size away from the edges. Finally I created this code for the interaction itself: 



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

This code states that if the 1 key is pressed, it will create a for loop thats repeats for each yellow circle. This way when 1 is pressed, each yellow circle will reposition. The same goes for if 2 is pressed, then the green circles will reposition. 

Finally , for an operation that imposes order, i created a noFill circle that snaps to an inviable grid whenever the mouse is moved. To this, i first created an int variable titled gridSize and made it 50, meaning that each square on the grid will be 50 pixels wide and tall. I then created this code to make the grid itself:

noStroke();
  for (int x = 0; x < width; x += gridSize) {
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y += gridSize) {
    line(0, y, width, y);
  }

This creates a for loop that generates lines on the x and y axis that match the height and width each square on the grid. Next to snap the mouse to this grid, i created this code: 

  int snappedX = round(mouseX / (float)gridSize) * gridSize;
  int snappedY = round(mouseY / (float)gridSize) * gridSize;

This code rounds the position of the mouse to the closest square on the grid, and snaps it to that position. Finally to make the circle snap to the same position as the mouse, I created this code:

 noFill();
  stroke(0);
  ellipse(snappedX, snappedY, gridSize * 4, gridSize * 4);


