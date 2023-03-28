# HuntersVsGatherers

There are 2 kinds of living entities with both sharing similar base DNA.
The left of the screen is populated with gatherers while the right with hunters.
The entire screen also contains food objects that can be utilized by the gatherers to reproduce. On the other side the hunters gain food by consuming the gathereres and consequently increasing in population.

The gatherers have a few traits:
1) It will look for food indfinetly.
2) Once food is found it will take 1 unit of food to the bsse.
3) If the resource location still has food left it will move directly for that location, else continue step 1.
4) If it touches an empty hunter it is eliminated.
5) If it touches a hunter that was already carrying food, it will eliminate the hunter.

Similarly the hunter has a few traits:
1) It will look for gatherers indefinitly.
2) Once it encounters a gatherer, it will eliminate it into food and move for the base.
3) While returning for the base if it encounters a gatherer it is eliminated and all fodo is lost.

Initial properties for both of the units can be changed in the B_Dots class's constructor, most drastic effects can be seen using loiter and velocity.
A wall class is still under implementation and will be added soon to limit travel direction and/or make zones.
