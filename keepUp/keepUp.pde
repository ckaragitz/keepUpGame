// Cameron Karagitz - KeepUp (Breakout Ripoff)
PImage water;

float ballX = 300;
float ballY = 150;
float dirX = 5;
float dirY = 5;
float speed = 1;
int size = 120;

int counter = 0;
int highScore = 0;
boolean firstGame = true;

void setup() {
  
  size(600, 600);
  water = loadImage("water.png");
  textAlign(CENTER);
  
}

void draw() {
  
  // draw assets
  background(75);
  image(water, 0, 530, 600, 50);
  image(water, 0, 505, 600, 150);
  
  // display instructions first time
  int m = millis();
  if(m <= 4000){
    textSize(20);
    text("Don't Let the Ball Hit the Water", 300, 100);
  }
  
  // draw score/counter
  textSize(20);
  text("Score: " + counter, 75, 50);
  
  // draw high score
  if(firstGame == false) {
    textSize(15);
    text("High Score: " + highScore, 75, 75);
  }
  
  // draw ball and paddle
  fill(255);
  ellipse(ballX,ballY,20,20);
  rect(mouseX, 500, size, 20);
  
  movement();
  
}

void movement() {
  
  // collision statements for Y and paddle
  if(ballY >= 550) {
    gameOver();
  } else if(ballY <= 0) {
    dirY = 5*speed;
    ballY += dirY;
  } else if(ballY >= 500 && ballX >= mouseX && ballX <= mouseX + size) {
    counter++;
    increaseDifficulty();
    dirY = -5*speed;
    ballY += dirY;
  } else {
    ballY += dirY;
  }
  
  // collision statements for X
  if(ballX <= 0) {
    dirX = 5*speed;
    ballX += dirX;
  }
  else if(ballX >= 600) {
    dirX = -5*speed;
    ballX += dirX;
  } else {
    ballX += dirX;
  }
   
}

void increaseDifficulty() {
  
  // speed multiplier and size decrementer
    if(counter % 10 == 0) {
      speed = speed + 0.2;
      if(size >= 20) {
        size = size - 5;
      }
    }
    
}

void gameOver() {
  
  firstGame = false;
  if(counter >= highScore) {
      highScore = counter;
    }
    
  noLoop();
  textSize(50);
  text("GAME OVER", 300, 300);
  textSize(20);
  text("Press SPACE to Play Again", 300, 350);

}

void reset() {
  
  // reset variables
  dirX = 5;
  dirY = 5;
  counter = 0;
  speed = 1;
  size = 120;
  
}

void keyPressed() {

  if(key== ' ') {
    ballX = 300;
    ballY = 100;
    reset();
    loop();
  }
  
}
