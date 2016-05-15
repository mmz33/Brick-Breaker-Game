//This class represents the message when the player win

class win {
  PFont font;
  float position;
  int speed;
  String win;
  boolean won;
  
  win() {
    font = createFont("Georgia", 20, true);
    textFont(font);
    win = "Congratulations You Won!";
    speed = 1;
  }
  
  void display() {
    fill(255);
    text(win, position, height/2);
  }

  void move() {
    position=position+speed;
    if (position>=width)
      position = -textWidth(win);
  }
}

