import java.util.Collections;
import java.util.Random;

int[] screen = { 800, 600 };
color background = #11BC1B;
ArrayList<PImage> images = new ArrayList<PImage>(53);
ArrayList<String> suits = new ArrayList<String>(4);
Deck deck;

void settings()
{
  size(screen[0], screen[1]); 
}

void setup()
{
  frameRate(30);
  
  suits.add("clubs");
  suits.add("diamonds");
  suits.add("hearts");
  suits.add("spades");
  
  for (int i=0; i < 4; i++)
  {
    for (int j=2; j < 15; j++)
    {
      System.out.println("i: " + Integer.toString(i) + ", j: " + Integer.toString(j));
      images.add(loadImage("assets/cards/" + suits.get(i) + "_" + Integer.toString(j) + ".jpg"));
    }
  }
  images.add(loadImage("assets/cards/back.jpg"));
  
  deck = new Deck();
}

void draw()
{
  background(background);
  
  for (int i=0; i < deck.cards.size(); i++)
    deck.cards.get(i).draw(new PVector(10*i, 10*i));
}