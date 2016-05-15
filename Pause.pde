//This class represents the message when game is paused

class pause {
  float position;
  PFont font;
  String pause;
  boolean gameIsPaused;

  pause() {
    font = createFont("Georgia", width/10, true);
    textFont(font);
    pause = "Game is paused!";
    gameIsPaused = false;
  }

  void display() {
    fill(255);
    text(pause, width/3-10, height/2);
  }
}

