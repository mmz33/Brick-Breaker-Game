import ddf.minim.*;
Minim minim;
Sound sound;
Bar bar;
Ball ball;
Target t;
pause p;
end e;
Option o;
win w;
PImage img1;
PImage img2;
PImage img3;
ArrayList<PImage> images;
int rand;

void setup() {
  size(400, 400);
  minim = new Minim(this);
  img1 = loadImage("p1.jpg");
  img1.resize(width,height);
  img2 = loadImage("p2.jpg");
  img2.resize(width,height);
  img3 = loadImage("p3.jpg");
  img3.resize(width,height);
  images = new ArrayList<PImage>();
  images.add(img1);
  images.add(img2);
  images.add(img3);
  rand = (int)(Math.random()*3);
  t = new Target(width,height);
  bar = new Bar();
  ball = new Ball();
  o = new Option();
  p = new pause();
  e = new end();
  w = new win();
  sound = new Sound(minim, minim.loadFile("brick.mp3"), minim.loadFile("GameOver.mp3"), minim.loadFile("gameSong.mp3"));
}

void draw() {
  playing();
}

void mouseMoved() {
  if (!p.gameIsPaused) 
    bar.move();
}

void playing() {
  image(images.get(rand),0,0);
  sound.play();
  t.display();
  if (!p.gameIsPaused) {
    if (!bar.gameStarted && !ball.gameEnded && !w.won) {
      o.display();
      o.move();
    }
    if (ball.ballStart) {
      ball.move();
    }
    if (t.boxes.size() == 0) {
      w.won = true;
      w.display();
      w.move();
      bar.display();
      bar.lock();
      sound.stopMusic();
    } else {
      bar.display();
      ball.display();
      ball.start();
      ball.bouncing();
      ball.remove();
      ball.hit();
    }
    if (ball.gameEnded) {
      sound.stopMusic();
      sound.gameEnded();
      bar.gameStarted = false;
      bar.display();
      e.display();
      t.display();
      bar.lock();
      ball.display();
    }
  } else {
    ball.display();
    bar.display();
    p.display();
  }
}

void replay() {
  sound.stopMusic();
  size(400, 400);
  minim = new Minim(this);
  bar = new Bar();
  ball = new Ball();
  t = new Target(width, height);
  o = new Option();
  p = new pause();
  e = new end();
  w = new win();
  rand = (int)(Math.random()*3);
  sound = new Sound(minim, minim.loadFile("brick.mp3"), minim.loadFile("GameOver.mp3"), minim.loadFile("gameSong.mp3"));
}

void keyPressed() {
  if (keyCode == LEFT || key == 'a') {
    bar.moveLeft();
  } else if (keyCode == RIGHT || key == 'd') {
    bar.moveRight();
  }
  if (key == 'p') {
    p.gameIsPaused = !p.gameIsPaused;
    if (! ball.gameEnded) {
      bar.gameStarted = ! bar.gameStarted;
    }
  } 
  if (key == ESC) {
    exit();
  }
  if (key == 'r') {
    replay();
  }
  if(key=='o') {
    bar.speedUp();
  }
  
  if(key=='m') {
    sound.mute();
  }
}


