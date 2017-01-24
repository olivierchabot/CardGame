

public class Button
{
  
  PVector size, position;
  String text;
  
  public Button(PVector s, PVector p, String t)
  {
    size = s;
    position = p;
    text = t;
  }
  
  public void draw()
  {
    fill(#111BBC);
    rect(position.x, position.y, size.x, size.y);
    
    fill(255);
    textSize(24);
    textAlign(LEFT, TOP);
    text(text, position.x, position.y);
  }
  
}