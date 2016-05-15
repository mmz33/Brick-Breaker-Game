//This class represents the Game Over message

class end {
  PFont font;
  int speed;
  String end;

  end() {
    font = createFont("Georgia", 20, true);
    textFont(font);
    end = "                  Game Over!\n      Press R to reply / Esc to exit";
    speed = 1;
  }

  void display() {
    fill(255);
    text(end, width/7, height/2);
  }
}

