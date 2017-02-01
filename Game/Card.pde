

public class Card
{
  
  PImage back;
  
  int num; //2-14, 2-Ace
  String suit;
  PImage img;
  boolean faceUp;
  
  public Card(int s, int n)
  {
    suit = suits[s];
    num = n;
    faceUp = false;
    
    img = images.get(s*(n-2));
    back = images.get(images.size()-1);
  }
  
  public boolean compareValue(Card c)
  {
    if (num == c.num) return true;
    return false;
  }
  
  public boolean compareSuit(Card c)
  {
    if (suit == c.suit) return true;
    return false;
  }
  
  public void draw(PVector v)
  {
    if (faceUp)
      image(img, v.x, v.y);
    else
      image(back, v.x, v.y);
  }
  
}