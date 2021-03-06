/*
  abstract class for buttons,
  holds size and position,
  draw and checkClick functions
*/

public abstract class Button
{
  
  PVector size, position;
  
  public Button(PVector s, PVector p)
  {
    size = s;
    position = p;
  }
  
  abstract public void draw();
  
  abstract public void checkClick();
  
}