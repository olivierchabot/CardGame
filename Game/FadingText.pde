/*
  Animation to show temporary text on sreen which fades out
*/

class FadingText extends Animation
{
 
  String text;
  int duration, timeAlive;
  color textColor;
  
  /*
    @param t : time on screen
    @param pos : position on screen
    @param c : color of the text
  */
  public FadingText(String t, PVector pos, int dur, color c)
  {
    super(pos);
    duration = dur*1000;
    text = t;
    textColor = c;
    timeAlive = 0;
    toKill = false;
  }
  
  //draws the text to the screen and calculates its alpha value
  void draw()
  {
    textAlign(CENTER);
    fill(textColor, (1.0 - ((float)timeAlive)/((float)duration))*192.0 + 64.0);
    textSize(72);
    text(text, position.x, position.y);
    
    timeAlive += delta;
    if (timeAlive >= duration)
      toKill = true;
  }
  
}