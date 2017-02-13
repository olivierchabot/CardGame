/*
  Collection Class for cards,
  holds 52 cards,
  shuffle, draw, respawn and pop functions
*/

public class Deck
{
  
  ArrayList<Card> cards = new ArrayList<Card>(52);
  
  public Deck()
  {
    refreshDeck();
  }
  
  //builds the deck
  public void refreshDeck()
  {
    for (int i=0; i < 4; i++)
      for (int j=2; j < 15; j++)
        cards.add(new Card(i, j));
        
    shuffle();
  }
  
  
  //shuffles the collection of cards
  private void shuffle()
  {
    Collections.shuffle(cards, new Random(System.nanoTime()));
  }
  
  //draws the cards to the screen
  public void draw()
  {
    for (Card c : cards)
      c.draw(new PVector(0, 0));
  }
  
  //removes and returns the top card from the deck
  public Card pop()
  {
    return cards.remove(cards.size()-1);
  }
  
}