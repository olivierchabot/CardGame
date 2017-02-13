/*
  Animation for an image going from one point to another,
  only used for the chips when placing a bet
*/

public class ChipAnim extends Animation
{
  
  PVector direction, end;
  PImage img;
  float speed;
 
  /*
    @param i : image of the chip
    @param start : starting coords
    @param e : end coords
    @param s : speed of the chip
  */
  public ChipAnim(PImage i, PVector start, PVector e, float s)
  {
    super(start);
    img = i;
    end = e;
    direction = (e.copy().sub(start)).normalize();
    speed = s;
  }
  
  //draw the chips to the screen
  public void draw()
  {
    if (position.dist(end) <= img.width/2) toKill = true;
    image(img, position.x, position.y);
    position.add(direction.mult(speed));
  }
  
}