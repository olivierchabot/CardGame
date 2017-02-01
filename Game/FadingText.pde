

class FadingText extends Animation
{
 
  String text;
  int duration, timeAlive;
  color textColor;
  
  public FadingText(String t, PVector pos, int dur, color c)
  {
    super(pos);
    duration = dur*100000;
    text = t;
    textColor = c;
    timeAlive = 0;
    toKill = false;
  }
  
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