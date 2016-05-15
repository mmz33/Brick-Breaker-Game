//This class represents the options of the game

class Option {
float position;
PFont font;
int speed;
String start, restart, speeding, exit;

Option() {
  font = createFont("Georgia", (width+height)/40, true);
  textFont(font);
  start = "Press Enter to Start";
  restart = "Press R to Restart";
  speeding = "Press O to speed the bar";
  exit = "Press Esc to Exit";
  speed = 1;
}

void display() {
  fill(255);
  text(start, position, height/2-30);
  text(restart, position, height/2);
  text(speeding, position, height/2+30);
  text(exit, position, height/2+60);
}

void move() {
  position += speed;
  if (position>=width)
    position = -textWidth(start);
}
}
