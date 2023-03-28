class Dot
{
  boolean state = false;
  int foodHolding = 0;
  int speed = 1;
  int loiter = 5;
  int HP = 10;
  float radius = 5;
  int colour;

  String destination = "loiter";

  PVector pos = new PVector();
  PVector velocity = new PVector();
  PVector foodPos = new PVector();

  Dot(int colour, PVector home)
  {
    state = true;
    this.colour = colour;

    pos.x = home.x;
    pos.y = home.y;
    foodPos.x = home.x;
    foodPos.y = home.y;
    if (colour == #00FF00)
      velocity = PVector.fromAngle(radians(random(-30, 30)));
    else if (colour == #FF0000)
    {
      loiter = 45;
      velocity = PVector.fromAngle(radians(random(180, 180)));
    }
    velocity.setMag(speed);
  }
  void update()
  {
    pos.x += velocity.x;
    pos.y += velocity.y;
    wall();
    show();
  }
  void destination(PVector loc)
  {
    velocity.y = loc.y - pos.y;
    velocity.x = loc.x - pos.x;
    velocity.setMag(speed);
  }
  void loiter()
  {
    velocity.rotate(random(radians(-loiter), radians(loiter)));
    velocity.setMag(speed);
  }
  boolean atHome(PVector home)
  {
    if (pos.x > home.x-radius && pos.x < home.x+radius)
      if (pos.y > home.y-radius && pos.y < home.y+radius)
      {
        return(true);
      }
    return(false);
  }
  void wall()
  {
    if (pos.x<=radius)
    {
      velocity.x = -velocity.x;
      pos.x = radius;
    } else if (pos.x >= (width-radius))
    {
      velocity.x = -velocity.x;
      pos.x = width-radius;
    }
    if (pos.y<=radius)
    {
      velocity.y = -velocity.y;
      pos.y = radius;
    } else if (pos.y >= (height-radius))
    {
      velocity.y = -velocity.y;
      pos.y = height-radius;
    }
  }

  void show()
  {
    stroke(colour);
    //fill(colour);
    noFill();
    circle(pos.x, pos.y, radius);
  }
}
