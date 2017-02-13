/*
  Card class, holds suit and value of each card,
  helper function compare()
*/

public class Card
{
  
  PImage back;
  
  int num; //2-14, 2-Ace
  String suit;
  PImage img;
  boolean faceUp;
  
  /*
    @param s : suit of the card
    @param n : value of the card [2-14] inclusive
  */
  public Card(int s, int n)
  {
    suit = suits[s];
    num = n;
    faceUp = false;
    
    img = images.get(s*(n-2));
    back = images.get(images.size()-1);
  }
  
  /*
    compares two cards
    @param c : card to compare to this
    returns -1 if this is smaller than c
    returns 1 if this is bigger than c
    returns 0 if they have the same value
  */
  public int compare(Card c)
  {
    if (num < c.num) return -1;
    else if (num > c.num) return 1;
    return 0;
  }
  
  //draw the card to the screen
  public void draw(PVector v)
  {
    if (faceUp)
      image(img, v.x, v.y);
    else
      image(back, v.x, v.y);
  }
  
}