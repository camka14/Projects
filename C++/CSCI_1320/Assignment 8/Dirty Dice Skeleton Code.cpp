#include <iostream>
#include <ctime>

using namespace std;

int roll();
int oneTurn(bool turn);
bool loopGame(int score);

int main()
{
	srand(time(NULL));
	bool winner;
	int score;
	// Starts game by prompting user to input score
	winner = loopGame(score);
	// Ends game by outputting the winner
	return 0;
}

int roll()
{
	// Runs rand() to give a value between 1 and 6
	return 0;
}
int oneTurn(bool turn)
{
	// Runs roll dice once then user decides if they want to run again
	// Adds the score from dice into variable and outputs when finished
	return 0;
}
bool loopGame(int score)
{
	// Takes in the winning score
	// First runs roll functions to decide who goes fist
	// Then enters while loop that waits for winning conditions
	// Runs oneTurn as first player
	// Then switches players and runs oneTurn again until someone wins
	return 0;
}