import java.util.Collections;
import java.util.Random;

//Window params
int[] screen = { 1800, 1400 };
color background = #11BC1B;

//Main collections
ArrayList<PImage> images = new ArrayList<PImage>(53);
final String[] suits = {"clubs", "diamonds", "hearts", "spades"};
Deck deck;
ArrayList<Card> hand = new ArrayList<Card>(3);
ArrayList<Card> flop = new ArrayList<Card>(2);
ArrayList<Button> buttons = new ArrayList<Button>();

int phase, pot, cash;

void settings()
{
  size(screen[0], screen[1]); 
}

void setup()
{
  frameRate(30);
  //load images
  for (int i=0; i < 4; i++)
    for (int j=2; j < 15; j++)
      images.add(loadImage("assets/cards/" + suits[i] + "_" + Integer.toString(j) + ".jpg"));
  images.add(loadImage("assets/cards/back.jpg"));
  
  cash = 101010100;
  startRound();
    
  //spawn buttons
  //buttons.add(new Button(new PVector(160, 80), new PVector(screen[0] - 200, screen[1] - 190), "reduce bet"));
  buttons.add(new PassButton(new PVector(160, 80), new PVector(screen[0] - 200, screen[1] - 100)));
  for (int i=0; i < 4; i++)
  {
    String value = Integer.toString((int)Math.pow(10,i));
    buttons.add(new ChipButton(new PVector(0, 0), new PVector(500 + 200*i, screen[1] - 150), loadImage("assets/chips/chip_" + value + ".png"), Integer.parseInt(value)));
  }
  
}

void startRound()
{
  phase = 0;
  pot = 0;
  
  deck = new Deck();
  //draw initial cards from the deck
  for (int i=0; i < 3; i++)
    hand.add(deck.pop());
  for (int i=0; i < 2; i++)
    flop.add(deck.pop());
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
  
  fill(255, 0, 0);
  text("$" + Integer.toString(pot), screen[0]/2, screen[1]/2);
}

boolean inRect(PVector mouse, PVector topLeft, PVector bottomRight)
{
  if (mouse.x <= bottomRight.x &&
      mouse.x >= topLeft.x &&
      mouse.y >= topLeft.y &&
      mouse.y <= bottomRight.y) return true;
  
  return false;
}

void mouseClicked()
{
  for (int i=0; i < buttons.size(); i++)
    buttons.get(i).checkClick();
}