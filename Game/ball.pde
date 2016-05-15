//This class represents the ball bouncing and drawing

class Ball {
  float positionX, positionY, radius; 
  float speedX, speedY;
  color c;
  boolean gameEnded, ballStart;


  Ball() {
    radius = 7;
    positionX = (width / 2);
    positionY = bar.y - radius;
    speedX = 1;
    speedY = 3;
    gameEnded = false;
    ballStart = false;
    c = color(random(0, 256), random(0, 256), random(0, 256));
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(positionX, positionY, 2 * radius, 2 * radius);
  }

  void move() {
    positionX += speedX;
    positionY -= speedY;
    if ((positionX + radius + 1) >= width || (positionX - radius - 1) <= 0) {
      speedX = speedX * -1;
    }
    if ((positionY + radius) >= height || (positionY - radius <= 0)) {
      speedY = speedY * -1;
    }
  }

  //The bar is divided into 4 parts
  void bouncing() {
    if (positionX  > bar.x && positionX < bar.x + bar.w / 4 && positionY + radius >= bar.y) {
      if (speedX < 0) {
        speedX = speedX * 1.5;
      } else {
        speedX =speedX * -1.5;
      }
      speedY = speedY * -1.5;
      if (speedX < 0) {
        speedX = constrain(speedX, -2, -3);
      } else {
        speedX = constrain(speedX, 2, 3);
      }
      speedY = constrain(speedY, 2, 4);
    } else if (positionX > bar.x + bar.w / 4 && positionX < bar.x + bar.w / 2 && positionY + radius >= bar.y) {
      if (speedX < 0) {
        speedX = speedX * 1 / 1.5;
      } else {
        speedX = speedX * -1 / 1.5;
      }
      speedY = speedY * -1 / 1.5;
      if (speedX < 0) {
        speedX = constrain(speedX, -2, -3);
      } else {
        speedX = constrain(speedX, 2, 3);
      }
      speedY = constrain(speedY, 2, 4);
    } else if (positionX > bar.x + bar.w / 2 && positionX < bar.x + 3 * bar.w / 4 && positionY + radius >= bar.y) {
      if (speedX < 0) {
        speedX = speedX * -1 / 1.5;
      } else {
        speedX = speedX * 1 / 1.5;
      }
      speedY = speedY * -1 / 1.5;
      if (speedX < 0) {
        speedX = constrain(speedX, -2, -3);
      } else {
        speedX = constrain(speedX, 2, 3);
      }
      speedY = constrain(speedY, 2, 4);
    } else if (positionX > bar.x + 3 * bar.w / 4 && positionX < bar.x + bar.w && positionY + radius >= bar.y) {
      if (speedX < 0) {
        speedX = speedX * -1.5;
      } else {
        speedX = speedX * 1.5;
      }
      speedY = speedY * -1.5;
      if (speedX < 0) {
        speedX = constrain(speedX, -2, -3);
      } else {
        speedX = constrain(speedX, 2, 3);
      }
      speedY = constrain(speedY, 2, 4);
    }
  }

  void hit() {
    for (int i = 0; i < t.boxes.size (); i++) {
      float wid = t.boxes.get(i).w;
      float brickX = t.boxes.get(i).x;
      float brickY = t.boxes.get(i).y;     
      // if it hits the box from the right side
      if (positionX - radius - 2 < brickX +wid && positionX - radius - 2 > brickX && positionY <= brickY+wid && positionY >= brickY) {
        sound.playHit();
        speedX = -speedX;
        t.boxes.remove(i);
        break;
      // if it hits the box from the left side
      } else if ( positionX + radius + 2 > brickX && positionX + radius + 2 < brickX + wid  && positionY <= brickY+wid && positionY >= brickY) {
        sound.playHit();
        speedX = - speedX;
        t.boxes.remove(i);
        break;
      }
      // if it hits the box from the lower side 
      else if ( positionY - radius - 2 < brickY + wid  && positionY - radius - 2 > brickY && positionX > brickX && positionX < brickX +wid) {
        sound.playHit();
        speedY = -speedY;
        t.boxes.remove(i);
        break;
      }
      // if it hits the box from the upper side
      else if (positionY + radius + 2 > brickY && positionY + radius + 2 < brickY + wid && positionX > brickX && positionX < brickX + wid) {
        sound.playHit();
        speedY = -speedY;
        t.boxes.remove(i);
        break;
      }
    }
  }

  void stop() {
    speedX = 0;
    speedY = 0;
  }

  void remove() {
    if (((positionX + radius < bar.x) || (positionX - radius > bar.x + bar.w)) && (positionY> bar.y)) {
      ball.stop();
      gameEnded = true;
    }
  }

  void start() {
    if (keyCode == ENTER) {
      bar.gameStarted = true;
      ball.ballStart = true;
    }
  }
}

