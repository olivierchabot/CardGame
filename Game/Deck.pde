

public class Deck
{
  
  ArrayList<Card> cards = new ArrayList<Card>(52);
  
  public Deck()
  {
    refreshDeck();
  }
  
  public void refreshDeck()
  {
    for (int i=0; i < 4; i++)
      for (int j=2; j < 15; j++)
        cards.add(new Card(i, j));
        
    shuffle();
  }
  
  private void shuffle()
  {
    Collections.shuffle(cards, new Random(System.nanoTime()));
  }
  
  public void draw()
  {
    for (Card c : cards)
      c.draw(new PVector(0, 0));
  }
  
  public Card pop()
  {
    return cards.remove(cards.size()-1);
  }
  
}