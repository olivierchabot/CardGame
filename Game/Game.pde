import java.util.Collections;
import java.util.Random;

int[] screen = { 800, 600 };
color background = #11BC1B;
ArrayList<PImage> images = new ArrayList<PImage>(53);
final String[] suits = {"clubs", "diamonds", "hearts", "spades"};
Deck deck;
ArrayList<Card> hand = new ArrayList<Card>(3);
ArrayList<Card> flop = new ArrayList<Card>(2);
ArrayList<Button> buttons = new ArrayList<Button>();

int phase, pot;

void settings()
{
  size(screen[0], screen[1]); 
}

void setup()
{
  frameRate(30);
  
  for (int i=0; i < 4; i++)
    for (int j=2; j < 15; j++)
      images.add(loadImage("assets/cards/" + suits[i] + "_" + Integer.toString(j) + ".jpg"));
  images.add(loadImage("assets/cards/back.jpg"));
  
  phase = 0;
  pot = 0;
  
  deck = new Deck();
  
  for (int i=0; i < 3; i++)
    hand.add(deck.pop());
  for (int i=0; i < 3; i++)
    hand.get(i).faceUp = true;
  for (int i=0; i < 2; i++)
    flop.add(deck.pop());
    
  buttons.add(new Button(new PVector(160, 80), new PVector(screen[0] - 200, screen[1] - 190), "reduce bet"));
  buttons.add(new Button(new PVector(160, 80), new PVector(screen[0] - 200, screen[1] - 100), "pass"));
  
}

void draw()
{
  background(background);
  
  deck.draw();
  
  for (int i=0; i < 3; i++)
    hand.get(i).draw(new PVector(i*150, screen[1] - 200));
  for (int i=0; i < 2; i++)
    flop.get(i).draw(new PVector(200 + i*150, 0));
    
  for (int i=0; i < buttons.size(); i++)
    buttons.get(i).draw();
}