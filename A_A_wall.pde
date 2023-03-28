class Wall
{
  int size;
  int colour = #818181;
  boolean atLoc[][][];
  Wall(int size)
  {
    this.size = size*2;
    atLoc = new boolean[height/size][width/size][2];
    int dy, dx;
    for (int y = 0; y<height; y+=size)
    {
      for (int x = 0; x<width; x+=size)
      {
        dy = y/size;
        dx = x/size;
        atLoc[dy][dx][0] = false;
        atLoc[dy][dx][1] = false;
      }
    }
  }
  void show()
  {
    
    int dy, dx;
    stroke(colour);
    strokeWeight(2);
    noFill();
    rectMode(CORNER);
    for (int y = 0; y<height; y+=size)
    {
      for (int x = 0; x<width; x+=size)
      {
        dy = y/size;
        dx = x/size;
        if(atLoc[dy][dx][0] == true)
        square(x, y, size);
      }
    }
  }
}
