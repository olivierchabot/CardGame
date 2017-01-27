import java.util.Collections;
import java.util.Random;

//Window params
int[] screen = { 1920, 1080 };
color background = #11BC1B;

//Main collections
ArrayList<PImage> images = new ArrayList<PImage>(53);
final String[] suits = {"clubs", "diamonds", "hearts", "spades"};
Deck deck;
ArrayList<Card> hand = new ArrayList<Card>(3);
ArrayList<Card> flop = new ArrayList<Card>(2);
ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList<Animation> animations = new ArrayList<Animation>();

public static enum Phase {
  BETTING, FLIP, REDUCE1, RIVER, REDUCE2, PAYOUT;
  private static Phase[] vals = values();
  public Phase next()
  { return vals[(this.ordinal()+1) % (vals.length)]; }
}

Phase phase;
float pot, cash;

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
  
  deck = new Deck();
  cash = 101010100;
  startRound();
    
  //spawn buttons
  buttons.add(new BetButton(new PVector(160, 80), new PVector(screen[0] - 200, screen[1] - 200)));
  buttons.add(new PassButton(new PVector(160, 80), new PVector(screen[0] - 200, screen[1] - 100)));
  for (int i=0; i < 4; i++)
  {
    String value = Integer.toString((int)Math.pow(10,i));
    buttons.add(new ChipButton(new PVector(0, 0), new PVector(500 + 200*i, screen[1] - 150), loadImage("assets/chips/chip_" + value + ".png"), Integer.parseInt(value)));
  }
  
}

void startRound()
{
  phase = Phase.BETTING;
  pot = 0.0;
  
  deck.shuffle();
  hand.clear();
  flop.clear();
  //draw initial cards from the deck
  for (int i=0; i < 3; i++)
    hand.add(deck.pop());
  for (int i=0; i < 2; i++)
    flop.add(deck.pop());
}

void draw()
{
  background(background);
  
  if (phase == Phase.FLIP)
  {
    for (int i=0; i < 3; i++)
      hand.get(i).faceUp = true;
    phase = phase.next();
  }
  if (phase == Phase.RIVER)
  {
    flop.get(0).faceUp = true;
    phase = phase.next();
  }
  if (phase == Phase.PAYOUT)
  {
    flop.get(1).faceUp = true;
    calculatePayout();
  }
  
  deck.draw();
  
  for (int i=0; i < 3; i++)
    hand.get(i).draw(new PVector(i*150, screen[1] - 200));
  for (int i=0; i < 2; i++)
    flop.get(i).draw(new PVector(200 + i*150, 0));
    
  for (int i=0; i < buttons.size(); i++)
    buttons.get(i).draw();
    
  for (int i=0; i < animations.size(); i++)
  {
    animations.get(i).draw();
    if (!animations.get(i).alive)
      animations.remove(i);
  }
  
  fill(255, 0, 0);
  text("$" + String.format("%.2f", pot), screen[0]/2, screen[1]/2);
}

boolean inRect(PVector mouse, PVector topLeft, PVector bottomRight)
{
  if (mouse.x <= bottomRight.x &&
      mouse.x >= topLeft.x &&
      mouse.y >= topLeft.y &&
      mouse.y <= bottomRight.y) return true;
  
  return false;
}

void calculatePayout()
{
  //calculate the payout :D
}

void mouseClicked()
{
  if (phase == Phase.PAYOUT)
    startRound();
  for (int i=0; i < buttons.size(); i++)
    buttons.get(i).checkClick();
}