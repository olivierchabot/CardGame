/*
  Button for placing your bet
*/

public class ChipButton extends Button
{

  PImage img;
  int value;
  
  /*
    @param s : size of the button
    @param p : position of the button
    @param i : image of the chip
    @param v : value of the chip
  */
  public ChipButton(PVector s, PVector p, PImage i, int v)
  {
    super(s, p);
    img = i;
    value = v;
    size.x = img.width;
    size.y = img.height;
  }
  
  //draw the chip to the screen
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
  
  //handle mouse click
  public void checkClick()
  {
    if (inRect(new PVector(mouseX, mouseY), position, position.copy().add(size))
        && phase == Phase.BETTING)
    {
      if (value <= cash)
      {
        cash -= value;
        pot += value;
        animations.add(new ChipAnim(img.copy(), position.copy(), new PVector(screen[0]/2 + random(-50, 50), screen[1]/2 + 100 + random(-50, 50)), 1.2));
      }
    }
  }
  
}