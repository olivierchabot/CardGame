

public class BetButton extends Button
{
 
  public BetButton(PVector s, PVector p)
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
    text("Reduce Bet", position.x + size.x/2, position.y + size.y/2);
  }
  
  public void checkClick()
  {
    if (inRect(new PVector(mouseX, mouseY), position, position.copy().add(size)))
    {
      if (phase == Phase.REDUCE1)
      {
        pot *= 0.666666;
        betCheck = true;
        phase = phase.next();
      }
      else if (phase == Phase.REDUCE2)
      {
        if (betCheck)
          pot *= 0.5;
        else
          pot *= 0.666666;
        phase = phase.next();
      }
    }
  }
  
}