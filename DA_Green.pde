class Green
{
  int populationTotal;
  int populationAlive;
  int production = 1;
  int colour = #00FF00;

  PVector baseLoc = new PVector(200, height/2);
  LinkedList<Dot> dots = new LinkedList();
  Base base;

  Green(int populationTotal, int populationAlive)
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
    if (current.foodHolding == 1)
    {
      current.speed = 1;
      if (current.atHome(baseLoc))
      {
        current.foodHolding = 0;
        base.food += 1;
        current.velocity.rotate(radians(180));
      } else
      {
        current.destination(baseLoc);
      }
    } 
    if (current.foodHolding == 0)
    {
      int dx = (int)(current.pos.x/size);
      int dy = (int)(current.pos.y/size);
      if (Food.atLoc[dy][dx][1] > 0)
      {
        current.foodPos.x = dx*size + (size/2);
        current.foodPos.y = dy*size + (size/2);
        Food.atLoc[dy][dx][1] -= 1;
        current.foodHolding = 1;
        current.destination(baseLoc);
      } else
      {
        dx = (int)(current.foodPos.x/size);
        dy = (int)(current.foodPos.y/size);
        if (Food.atLoc[dy][dx][1] > 0)
        {
          current.destination(current.foodPos);
        } else
        {
          current.speed = 5;
          current.loiter();
        }
      }
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
