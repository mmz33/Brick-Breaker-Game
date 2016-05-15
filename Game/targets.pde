//This class represents all the bricks (boxes)

class Target {
  ArrayList<Box> boxes  = new ArrayList<Box>();
  PImage img; 
  Target(int w, int h) {
    img = loadImage("skull.jpg");
    for (int x = 0; x<w; x+=25) {
      for (int y = 0; y<h/4; y+=25) {
        Box b = new Box(x, y);
        boxes.add(b);
      }
    }
  }
  
  void display() {
    for (int i = 0; i<boxes.size (); i++) {
      boxes.get(i).display();
      //int wid = (int)boxes.get(i).w;
      //img.resize(wid,wid);
      //image(img,boxes.get(i).x, boxes.get(i).y);
    }
  }
}

