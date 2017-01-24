

public class Deck
{
  
  ArrayList<Card> cards = new ArrayList<Card>(52);
  
  public Deck()
  {
    for (int i=0; i < 4; i++)
      for (int j=2; j < 15; j++)
        cards.add(new Card(i, j));
  }
  
  public void shuffle()
  {
    Collections.shuffle(cards, new Random(System.nanoTime()));
  }
  
}