//This class represents a brick

class Box {
  float x;
  float y;
  float w;
  color c;
  
  Box(float x, float y) {
    this.x = x;
    this.y = y;
    c = color(255,0,0);
    w = 25;
  }
  
  void display() {
    fill(c);
    stroke(0);
    strokeWeight(3);
    rect(x,y,w,w);
  }
  
}
