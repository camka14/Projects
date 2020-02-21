#ifndef MAZE_H
#define MAZE_H

#include <vector>
#include "Player.h"

enum class SquareType { Wall, Exit, Empty, Human, Enemy, Treasure1 , Treasure2, Treasure3};

// This function returns a string representation of a given SquareType
std::string SquareTypeStringify(SquareType sq);

class Board {
public:
	Board();
	
	int get_rows() const {return 4; }  // You should be able to change the size of your 
	int get_cols() const {return 4; }  // board by changing these numbers and the numbers in the arr_ field

	// Returns the SquareType of a position on the board
	SquareType get_square_value(Position pos) const; 

	// Set the value of a square to the given SquareType
	void SetSquareValue(Position pos, SquareType value); 

	// Get the possible Positions that a Player could move to
	// (not off the board or into a wall)
	std::vector<Position> GetMoves(Player *p);

	// Move a player to a new position on the board. Return
	// true if they moved successfully, false otherwise.
	void MovePlayer(Player *p, Position pos);

	// Get the square type of the exit square
	SquareType GetExitOccupant();

	// Outputs the board onto the screen
	friend std::ostream& operator<<(std::ostream& os, const Board &b);

private:
	SquareType arr_[4][4];
	
	int rows_;
	int cols_;
};  // class Board

class Maze {
public:
	Maze(); // constructor

	// Initialize a new game, given one human player and 
	// a number of enemies to generate
	void NewGame(Player *human, const int enemies);

	// Have the given Player take their turn
	void TakeTurn(Player *p);

	// Get the next player in turn order
	Player * GetNextPlayer();

	// Return true if the human made it to the exit 
	// or the enemies ate all the humans
	bool IsGameOver();

	// String info about the game's conditions after it is over
	std::string GenerateReport();

private:
	Board *board_; 
	std::vector<Player *> players_;
	int turn_count_;
};  // class Maze

#endif  // MAZE_H
