

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