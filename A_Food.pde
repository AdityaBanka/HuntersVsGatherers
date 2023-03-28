class food
{
  int probabality;
  int size;
  int atLoc[][][];

  food(int size, int probabality)
  {
    this.size = size;
    this.probabality = probabality;
    atLoc = new int[height/size][width/size][2];
    int dy, dx;
    for (int y = 0; y<height; y+=size)
    {
      for (int x = 0; x<width; x+=size)
      {
        dy = y/size;
        dx = x/size;
        atLoc[dy][dx][0] = (int)random(1, 101);
        if (atLoc[dy][dx][0] <= probabality)
          atLoc[dy][dx][1] = (int)random(1, size+1);
        else
          atLoc[dy][dx][1] = 0;
      }
    }
  }
  void rePopulate()
  {
    int dy, dx;
    for (int y = 0; y<height; y+=size)
    {
      for (int x = 0; x<width; x+=size)
      {
        dy = y/size;
        dx = x/size;
        if (atLoc[dy][dx][0] >= probabality)
        {
          int chance = (int)random(0, 101);
          if(chance == 100)
          {
          atLoc[dy][dx][0] = probabality;
          atLoc[dy][dx][1] = (int)random(1, size+1);
          }
        }
      }
    }
  }
  void clearing(PVector pos, int extent)
  {
    for (int y = (int)(pos.y-extent); y<=pos.y+extent; y+=size)
    {
      for (int x = (int)(pos.x-extent); x<=pos.x+extent; x+=size)
      {
        int dy = y/size;
        int dx = x/size;
        if(atLoc[dy][dx][0] == 1)
        atLoc[dy][dx][1] = 0;
      }
    }
  }

  void show()
  {
    stroke(#FFFF00);
    noFill();
    int dy, dx;
    for (int y = 0; y<height; y+=size)
    {
      for (int x = 0; x<width; x+=size)
      {
        dy = y/size;
        dx = x/size;
        if (atLoc[dy][dx][0] <= probabality)
        {
          int extent = atLoc[dy][dx][1];
          int shift = (size-extent)/2;
          rect(x+shift, y+shift, extent, extent);
        }
      }
    }
  }
}
