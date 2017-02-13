/*
  Button to reduce bet on the two betting phases
*/

public class BetButton extends Button
{
 
  /*
    @param s : size of the button
    @param p : position of the button
  */
  public BetButton(PVector s, PVector p)
  {
    super(s, p);
  }
  
  //draw the button to the screen, changing colour if moused over
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
  
  //handle moues click
  public void checkClick()
  {
    if (inRect(new PVector(mouseX, mouseY), position, position.copy().add(size)))
    {
      if (phase == Phase.REDUCE1)
      {
        pot *= 0.666666;
        betCheck = true;
        phase = phase.next();
        animations.add(new FadingText("Reduce your bet or pass", new PVector(screen[0]/2, screen[1]/2 - 100), 3, #FC2EE5));
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