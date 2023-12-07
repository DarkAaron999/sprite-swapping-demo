enum Direction {South, West, East, North, SouthEast, SouthWest,  NorthWest, NorthEast};

class Hero {
  PVector position;
  PVector velocity;
  int speed = 2;
  PImage spriteSheet;

  
  
  int xOffset = 0;
  int yOffset = 0;
  int xWidth = 64;
  int yHeight = 64;
  int frames = 4;
  int frame = 0;
  
  Direction direction = Direction.South;

  Hero() {
    position = new PVector(width/2, height/2);
    velocity = new PVector();
    spriteSheet = loadImage("stella_walk.png");
  }

  void move() {
    //why am I making a new vector now ? Because I want to normalize it to keep the diagonal
    //movement at the same speed as orthogonal movement. BUT if I were to normalise the vector
    //velocity this would mess up my += and -= math on the keystrokes (because the values
    //would start to be less than 1 when moving diagonally, so the keystrokes wouldn't cancel
    //each other out.
    PVector movement = velocity.copy();
    movement.setMag(speed); //setMag does .normalize() and then .mult(speed) :-)
    position.add(movement);
    
    if (frameCount%10 == 0 && (velocity.x !=0 || velocity.y !=0)){
      frame = (frame + 1)%frames;
    }
  }

  void display() {
    fill(255);
    rect(position.x - xWidth/4, position.y - 0.9 * yHeight, xWidth/2, yHeight);
    direction = getDirection();
    copy(spriteSheet,
          xOffset + xWidth * frame,  yOffset + yHeight * direction.ordinal(), xWidth, yHeight,
          int (position.x - xWidth/2), int (position.y - 0.9 * yHeight), xWidth, yHeight);
  }
Direction getDirection(){
  if (velocity.x == 0 && velocity.y == -1) {
    return Direction.North;
  }
   if (velocity.x == 0 && velocity.y == -1) {
    return Direction.North;
  }
  
  

  return direction;
}
}
