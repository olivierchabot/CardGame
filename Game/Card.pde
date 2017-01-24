

public class Card
{
  
  PImage back;
  
  int num; //2-14, 2-Ace
  String suit;
  PImage img;
  boolean faceUp;
  
  public Card(int s, int n)
  {
    suit = suits.get(s);
    num = n;
    faceUp = false;
    
    img = images.get(s*(n-2));
    back = images.get(images.size()-1);
  }
  
  public int compare(Card c)
  {
    if (num < c.num) return -1;
    else if (num > c.num) return 1;
    return 0;
  }
  
  public void draw(PVector v)
  {
    if (faceUp)
      image(img, v.x, v.y);
    else
      image(back, v.x, v.y);
  }
  
}