

public class PassButton extends Button
{
 
  public PassButton(PVector s, PVector p)
  {
    super(s, p);
  }
  
  public void draw()
  {
    fill(#111BBC);
    rect(position.x, position.y, size.x, size.y);
    
    if (inRect(new PVector(mouseX, mouseY), position, position.copy().add(size)))
      fill(255);
    else
      fill(0, 255, 0);
    textSize(24);
    textAlign(CENTER, CENTER);
    text("Pass", position.x + size.x/2, position.y + size.y/2);
  }
  
  public void checkClick()
  {
    
  }
  
}