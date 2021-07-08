// Emily Seddon - KeepUp (Breakout Ripoff)
PImage water;

float ballX = 300;
float ballY = 150;
float dirX = 5;
float dirY = 5;

void setup() {
  size(600, 600);
  water = loadImage("water.png");
  textAlign(CENTER);
}

void draw() {
  background(75);
  image(water, 0, 530, 600, 50);
  image(water, 0, 505, 600, 150);
  
  int m = millis();
  if(m <= 4000){
    textSize(20);
    text("Don't Let the Ball Hit the Water", 300, 100);
  }
  
  // draw ball and paddle
  fill(255);
  ellipse(ballX,ballY,20,20);
  rect(mouseX, 500, 120, 20);
  
  // collision statements for Y and paddle
  if(ballY >= 550) {
    noLoop();
    textSize(50);
    text("GAME OVER", 300, 300);
    textSize(20);
    text("Press SPACE to Play Again", 300, 350);
  } else if(ballY <= 0) {
    dirY = 5;
    ballY += dirY;
  } else if(ballY >= 500 && ballX >= mouseX && ballX <= mouseX + 120) {
    dirY = -5;
    ballY += dirY;
  } else {
    ballY += dirY;
  }

  // collision statements for X
  if(ballX <= 0) {
    dirX = 5;
    ballX += dirX;
  }
  else if(ballX >= 600) {
    dirX = -5;
    ballX += dirX;
  } else {
    ballX += dirX;
  }
   
}

void keyPressed() {

  if(key== ' ') {
    ballX = random(20, 580);
    ballY = random(50, 350);
    loop();
  }
  
}
