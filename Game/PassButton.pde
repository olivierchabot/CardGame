/*
  Button for passing instead of reducing the bet
*/

public class PassButton extends Button
{
 
  /*
    @param s : size of the button
    @param p : position of the button
  */
  public PassButton(PVector s, PVector p)
  {
    super(s, p);
  }
  
  //draw the button to the screen
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
    text("Let it ride!", position.x + size.x/2, position.y + size.y/2);
  }
  
  //handle mouse click
  public void checkClick()
  {
    if (inRect(new PVector(mouseX, mouseY), position, position.copy().add(size)))
    {
      if (phase == Phase.BETTING)
      {
        phase = phase.next();
        animations.add(new FadingText("Reduce your bet or pass", new PVector(screen[0]/2, screen[1]/2 - 100), 3, #FC2EE5));
      }
      else if (phase == Phase.REDUCE1)
      {
        phase = phase.next();
        animations.add(new FadingText("Reduce your bet or pass", new PVector(screen[0]/2, screen[1]/2 - 100), 3, #FC2EE5));
      }
      else if (phase == Phase.REDUCE2)
      {
        phase = phase.next();
      }
    }
  }
  
}