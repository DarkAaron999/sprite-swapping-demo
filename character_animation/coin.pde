class Coin {
  PVector position;
  float r = 10;
  int frame = 0;
  
  Coin(){
    position = new PVector(random(width-50), random(height-50));
  }
  
  void display(){
    
PImage[] anim = new PImage[6];
  anim[0] = loadImage ("star coin rotate 1.png");
  anim[1] = loadImage ("star coin rotate 2.png");
  anim[2] = loadImage ("star coin rotate 3.png");
  anim[3] = loadImage ("star coin rotate 4.png");
  anim[4] = loadImage ("star coin rotate 5.png");
  anim[5] = loadImage ("star coin rotate 6.png");
  
    fill(250, 255, 5);
    circle(position.x, position.y, 2*r);
    
    image (anim[frame], 20, 20);
    
    if (frame % 10 == 0) {
      frame = (frame + 1) % anim.length;
    }
  }
  
  boolean collision(float x, float y, float w, float h){
    //remember that we're drawing her at
    //rect(x - w/4, y - 0.9 * h, w/2, h);
    //debug: show the hitbox diagonal:
    //line((x - w/4), (y - 0.9 * h), (x + w/4), (y - 0.9 * h) + h);
    if((x - w/4) < position.x - r && (x + w/4) > position.x + r
        && (y - 0.9 * h) < position.y - r && (y - 0.9 * h) + h > position.y + r){
          coinSpiner.play();
      return true;
    }
    else return false;
  }

}
