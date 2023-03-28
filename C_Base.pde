class Base
{
  PVector pos = new PVector();
  int extent;
  int colour;
  int food = 1;
  int HP = 10;
  
  Base(PVector pos, int colour)
  {
    this.pos = pos;
    this.extent = 10;
    this.colour = colour;
    Food.clearing(this.pos, extent);
  }
  void show()
  {
    text(food, pos.x, pos.y);
    rect(pos.x, pos.y, extent, extent);
  }
}
