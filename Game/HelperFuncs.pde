//for getHand() in Game
//ArrayList<> tempCards = new ArrayList<>(5);

public boolean checkPair(ArrayList<Card> cards)
{
  for(int i = 0; i < 5; i++)
  {
    Card  c = cards.get(i);
    if (c.num < 10) {i++; c = cards.get(i);}
    for(int j = 1; j < 4; j++)
    {
      Card  d = cards.get(j);
      if(c.compareValue(d)) {return true;}
    }
  }
  return false;
}

public boolean checkTwoPair(ArrayList<Card> cards)
{
  int numPairs = 0;
  for(int i = 0; i < 5; i++)
  {
    Card  c = cards.get(i);
    if (c.num < 10) {i++; c = cards.get(i);}
    for(int j = 1; j < 4; j++)
    {
      Card  d = cards.get(j);
      if(c.compareValue(d)) numPairs++;
      if(numPairs == 2) return true;
    }
  }
  return false;
}

public boolean checkThreeOfAKind(ArrayList<Card> cards)
{
  for(int i = 0; i < 5; i++)
  {
    if (c.num < 10) i++;
    Card  c = cards.get(i);
    for(int j = 1; j < 4; j++)
    {
      Card  d = cards.get(j);
      if(!c.compareValue(d)) break;
      for(int k = 2; k < 3; k++)
      {
        Card  e = cards.get(j);
        if(d.compareValue(e)) return true;
      }
    }
  }
  return false;
}

public boolean checkFlush(ArrayList<Card> cards)
{
  
  Card first = cards.get(0);
  for(Card i: cards)if (!first.compareSuit(i)) return false;
  return true;
}

public boolean checkStraight(ArrayList<Card> cards)
{
  for (int i = 4; i > 0; i--) {if (cards.get(i).num != (cards.get(i-1).num) + 1) return false;}
  return true;
}

public boolean fullHouse(ArrayList<Card> cards)
{
  if (checkThreeOfAKind(cards)
}