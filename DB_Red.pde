class Red
{
  int populationTotal;
  int populationAlive;
  int production = 1;
  int colour = #FF0000;

  PVector baseLoc = new PVector(width-200, height/2);
  LinkedList<Dot> dots = new LinkedList();
  Base base;

  Red(int populationTotal, int populationAlive)
  {
    this.populationTotal = populationTotal;
    this.populationAlive = populationAlive;
    for (int i = 0; i<populationAlive; i++)
    {
      dots.add(new Dot(colour, baseLoc));
    }
    base = new Base(baseLoc, colour);
  }
  void update()
  {
    production();
    for (Dot current : dots)
    {
      place(current);
      current.update();
    }
    prune();
    base.show();
  }
  void place(Dot current)
  {
    if (current.foodHolding == 0)
    {
      for (Dot Green : green.dots)
      {
        int dx = (int)abs(current.pos.x - Green.pos.x);
        if (dx<=(current.radius+Green.radius))
        {
          int dy = (int)abs(current.pos.y - Green.pos.y);
          dy *= dy;
          dx *= dx;
          float dis = sqrt(dy+dx);
          if (dis<=(current.radius+Green.radius))
          {
            Green.HP = 0;
            current.speed = 5;
            current.foodHolding = 1;
            current.destination(baseLoc);
          }
        }
      }
      if (current.foodHolding == 0)
      {
        current.speed = 1;
        current.loiter();
      }
    } else
    {
      for (Dot Green : green.dots)
      {
        int dx = (int)abs(current.pos.x - Green.pos.x);
        if (dx<=(current.radius+Green.radius))
        {
          int dy = (int)abs(current.pos.y - Green.pos.y);
          dy *= dy;
          dx *= dx;
          float dis = sqrt(dy+dx);
          if (dis<=(current.radius+Green.radius))
          {
            current.HP = 0;
          }
        }
      }
      if (current.atHome(baseLoc))
      {
        current.speed = 2;
        current.foodHolding = 0;
        base.food += 1;
        current.HP = 2;
        current.velocity.rotate(radians(180));
      } else
        current.destination(baseLoc);
    }
  }
  void production()
  {
    if (populationAlive<populationTotal)
    {
      if (base.food>=production)
      {
        int baby = min(base.food-production, populationTotal-populationAlive);
        for (int i = 0; i<baby; i++)
        {
          populationAlive++;
          dots.add(new Dot(colour, baseLoc));
          base.food -= production;
        }
      } else
        base.HP++;
    }
  }
  void prune()
  {
    Iterator<Dot> current = dots.iterator();
    while (current.hasNext()) {
      if (current.next().HP == 0)
      {
        current.remove();
        populationAlive--;
      }
    }
  }
}
