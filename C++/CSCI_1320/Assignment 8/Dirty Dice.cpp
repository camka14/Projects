#include <iostream>
#include <ctime>

using namespace std;

int roll();
int oneTurn(bool turn);
bool loopGame(int score);

int main()
{
	srand(time(NULL)); // Seed the random function with time
	bool winner;
	int score;
	cout << "Input score between 100 and 200 to win: " << endl;
	cin >> score; // Input of the score to win
	winner = loopGame(score); // Starts the loop to play the game
	if(winner == 0)
	{
		cout << "Player Wins!" << endl;
	}
	else
	{
		cout << "Computer Wins!" << endl;
	}
}

int roll()
{
	int roll;
	roll = rand()%6+1; // Randomly selects a number between 6 and 1
	return roll;
}
int oneTurn(bool player)
{
	int score = 0;
	int rolled;
	char choice = 'r';
	while(true)
	{
		if(player == 0) // Player's turn
		{
			if(choice == 'e')
				return score; // Ends turn
			else
			{
				rolled = roll();
				cout << rolled << endl;
				if(rolled == 3) // Ends turn if rolled a 3
					return 3;
				else
				{
					score += rolled; // Adds the roll to the score
					cout << "Total " << score << endl;
				}
			}
			cout << "Press r to roll or e to end turn" << endl;
			cin >> choice; // Decide to roll or not
		}
		else // Computer's turn
		{
			while(score < 15) // Only ends turn if it reaches 15
			{
				rolled = roll();
				cout << rolled << endl;
				if(rolled == 3)
					return 3;
				else
					score += rolled;
			}
			cout << "Total " << score << endl;
			return score;
		}
	}
}
bool loopGame(int score)
{
	bool player;
	int score0 = 100;
	int score1 = 100;
	int new_score;
	player = rand()%2; // Decides who goes first
	while(score0 < score && score1 < score) // Checks if winning conditions have been met
	{
		if(player == 0)
		{
			cout << "Player's turn" << endl;
			new_score = oneTurn(player);
			score0 += new_score; // Adds score to player and takes away from computer
			score1 -= new_score;
			player = 1;
		}
		else
		{
			cout << "Computer's turn" << endl;
			new_score = oneTurn(player);
			score1 += new_score; // Adds score to computer and takes away from player
			score0 -= new_score;
			player = 0;
		}
		cout << "Player score: " << score0
		<< " Computer score: " << score1<< endl;
	}
	if(score0 >= score) // Returns final result
		return 0;
	else
		return 1;
}