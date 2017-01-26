

public class ChipButton extends Button
{

  PImage img;
  int value;
  
  public ChipButton(PVector s, PVector p, PImage i, int v)
  {
    super(s, p);
    img = i;
    value = v;
    size.x = img.width;
    size.y = img.height;
  }
  
  public void draw()
  {
    image(img, position.x, position.y);
    
    if (inRect(new PVector(mouseX, mouseY), position, position.copy().add(size)))
      fill(255);
    else
      fill(0, 255, 0);
    textSize(24);
    textAlign(CENTER, CENTER);
    text(Integer.toString(value), position.x + size.x/2, position.y + size.y/2);
  }
  
  public void checkClick()
  {
    if (inRect(new PVector(mouseX, mouseY), position, position.copy().add(size)))
    {
      if (value <= cash && phase == 0)
      {
        cash -= value;
        pot += value;
      }
    }
  }
  
}