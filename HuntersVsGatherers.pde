import java.util.*;
int max = 1200;
int alive = 100;
int size = 20;

food Food;
Wall wall;
Green green;
Red red;

void setup()
{
  //size(800, 800);
  fullScreen();
  Food = new food(size, 10);
  wall = new Wall(size);
  green = new Green(max, alive);
  red = new Red(max, alive);
}
void draw()
{
  background(0);
  if (mousePressed)
  {
    int dx = mouseX/wall.size;
    int dy = mouseY/wall.size;
    if (wall.atLoc[dy][dx][0] == false && wall.atLoc[dy][dx][1] == false && mouseButton == LEFT)
    {
      wall.atLoc[dy][dx][0] = true;
      wall.atLoc[dy][dx][1] = true;
    } else if (wall.atLoc[dy][dx][0] == true && wall.atLoc[dy][dx][1] == false && mouseButton == RIGHT)
    {
      wall.atLoc[dy][dx][0] = false;
      wall.atLoc[dy][dx][1] = true;
    }
  }
  if (frameCount%500 == 0)
    thread("repo");

  wall.show();
  strokeWeight(1);
  Food.show();


  if (green.populationAlive>0)
    green.update();
  if (red.populationAlive>0)
    red.update();

  text(green.populationAlive, width/2, height/2);
}
void repo()
{
  Food.rePopulate();
}
void mouseReleased()
{
  int dy, dx;
  for (int y = 0; y<height; y+=size)
  {
    for (int x = 0; x<width; x+=size)
    {
      dy = y/size;
      dx = x/size;
      wall.atLoc[dy][dx][1] = false;
    }
  }
}
