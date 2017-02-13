/*
  abstract class for animations,
  holds position and current state,
  draw function
*/

public abstract class Animation
{
  
  PVector position;
  boolean toKill;
 
  public Animation(PVector start)
  {
    position = start;
    toKill = false;
  }
  
  public void draw()
  { }
  
}