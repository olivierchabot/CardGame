

public class ChipAnim extends Animation
{
  
  PVector direction, end;
  PImage img;
  float speed;
 
  public ChipAnim(PImage i, PVector start, PVector e, float s)
  {
    super(start);
    img = i;
    end = e;
    direction = (e.copy().sub(start)).normalize();
    speed = s;
  }
  
  public void draw()
  {
    if (position.dist(end) <= img.width/2) toKill = true;
    image(img, position.x, position.y);
    position.add(direction.mult(speed));
  }
  
}