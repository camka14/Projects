#include "Maze.h"
#include "Player.h"
#include <iostream>


int main()
{
	// New player and new maze where we start a new game with the player as the input
	Player *p1 = new Player("Camka",true);
	Maze *M = new Maze();
	M->NewGame(p1,2);
}