//This class represents the bar 

class Bar {
  float x;
  float y;
  float w;
  float h;
  float s;
  boolean locked, gameStarted;
  PImage skate;

  Bar() {
    skate = loadImage("skate.jpg");
    w = 80;
    h = 15;
    x = width/2-w/2;
    y = height-h;
    s = 8;
    locked=true;
  }

  void display() {
    fill(255, 0, 0);
    rect(x, y, w, h);
    //skate.resize((int)w,(int)h);
    //image(skate,x,y);
  }

  void moveRight() {
    if (gameStarted) {
      x += s;
      if (x>width-w)
        x = width-w;
    }
  }

  void moveLeft() {
    if (gameStarted) {
      x -= s;
      if (x<0)
        x=0;
    }
  }

  void lock() {
    locked = true;
  }

  void speedUp() {
    s+=0.5;
  }

  void move() {
    if (gameStarted) {
      x = mouseX;
      if (x <= 0) {
        x = 0;
      }
      if (x >= width - w) {
        x = width - w;
      }
    }
  }
}

