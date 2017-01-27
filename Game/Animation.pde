

public class Animation
{
  
  PVector position, direction, end;
  boolean alive;
  PImage img;
  float speed;
 
  public Animation(PImage i, PVector start, PVector e, float s)
  {
    img = i;
    position = start;
    end = e;
    direction = (e.copy().sub(start)).normalize();
    speed = s;
    alive = true;
  }
  
  public void draw()
  {
    if (position.dist(end) <= img.width/2) alive = false;
    image(img, position.x, position.y);
    position.add(direction.mult(speed));
  }
  
}