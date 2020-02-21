#include <cstdlib>
#include <ctime>
#include <iostream>
#include <string>
#include <algorithm>
#include "Maze.h"
#include "Player.h"

// This function returns a string representation of a given SquareType
std::string SquareTypeStringify(SquareType sq)
{
    if(sq == SquareType::Wall)
    {
        return "X";
    }else if(sq == SquareType::Exit){
        return ">";
    }else if(sq == SquareType::Empty){
        return "[]";
    }else if(sq == SquareType::Human){
        return "H";
    }else if(sq == SquareType::Enemy){
        return "E";
    }else if(sq == SquareType::Treasure1){
        return "1";
    }else if(sq == SquareType::Treasure2){
        return "2";
    }else{
        return "3";
    }
}

///////////////////////
// Board //////////////
///////////////////////

// Sets all positions to empty
Board::Board()
{
    rows_ = 4;
    cols_ = 4;
    for(int r=0; r<rows_; r++)
    {
        for(int c=0; c<cols_; c++)
        {
            arr_[r][c] = SquareType::Empty;
        }
    }
 }

// Returns the SquareType of a position on the board
SquareType Board:: get_square_value(Position pos) const
{
    // Checks if the position is on the board otherwise it will return a wall
    if(0 <= pos.row && pos.row < rows_ && 0 <= pos.col && pos.col < cols_)
    {
    	return arr_[pos.row][pos.col];
    }
    return SquareType::Wall;
}

// Set the value of a square to the given SquareType
void Board::SetSquareValue(Position pos, SquareType value)
{
    arr_[pos.row][pos.col] = value;
}

// Get the possible Positions that a Player could move to
// (not off the board or into a wall)
std::vector<Position> Board::GetMoves(Player *p)
{
    // Create the possible positions and set them to the initial player position
    Position pos, up, right, left, down; 
    pos = up = right = left = down = p->get_position();

    // Incrementing each possible positions direction
    up.col++;
    right.row++;
    left.row--;
    down.col--;

    // Get the SquareType of each possible direction
    SquareType upSquare = get_square_value(up);
    SquareType rightSquare = get_square_value(right);
    SquareType leftSquare = get_square_value(left);
    SquareType downSquare = get_square_value(down);
    std::vector<Position> options;

    // If the direction isn't a wall it pushes it into the options vector
    if(upSquare != SquareType::Wall)
    {
        options.push_back(up);
    }
    if(rightSquare != SquareType::Wall)
    {
        options.push_back(right);
    }
    if(leftSquare != SquareType::Wall)
    {
        options.push_back(left);
    }
    if(downSquare != SquareType::Wall)
    {
        options.push_back(down);
    }
    return options;
}

// Move a player to a new position on the board. Return
// true if they moved successfully, false otherwise.
void Board::MovePlayer(Player *p, Position pos)
{
    // Getting new positions SquareType
    SquareType sq = get_square_value(pos);

    // If the new position is an Enemy or an Exit
    if(sq == SquareType::Enemy)
    {
        // If the player is human it will delete the human otherwise nothing happens
        if(p->is_human()){
            SetSquareValue(p->get_position(),SquareType::Empty);
            return;
        }
        return;
    }else if(sq == SquareType::Exit){
        // If the player is an Enemy they won't move otherwise it will continue as normal
        if(!p->is_human()){
            return;
        }
    }

    // If the SquareType is not a wall then it will enter the if statement
    if(sq != SquareType::Wall){

        // Set the player position to empty and set the player's position to the new value
        SetSquareValue(p->get_position(),SquareType::Empty);
        p->SetPosition(pos);

        // If the Square is a Tressure the player gets 100 points and the Tressure is deleted, Human or Enemy
        if(sq == SquareType::Treasure1)
        {
            p->ChangePoints(100);
        }else if(sq == SquareType::Treasure2)
        {
            p->ChangePoints(200);
        }else if(sq == SquareType::Treasure3)
        {
            p->ChangePoints(300);
        }
        
        // Sets the new square value as what ever the player is
        if(p->is_human()){
            SetSquareValue(pos, SquareType::Human);
        }else{
            SetSquareValue(pos, SquareType::Enemy);
        }
        return;
    }
    return;
}

// Get the square type of the exit square
SquareType Board::GetExitOccupant()
{
    Position pos = {.row = 0, .col = cols_-1};
    return get_square_value(pos);
}

// Outputs the board onto the screen
std::ostream& operator<<(std::ostream& os, const Board &b)
{
    Position pos;
    for(int r=b.get_rows()-1; r>=0; r--)
    {
        for(int c=0; c<b.get_cols(); c++)
        {
            pos = {.row = r, .col = c};
            os << SquareTypeStringify(b.get_square_value(pos)) << " ";
        }
        os << std::endl;
    }
    return os;
}

///////////////////////
// MAZE ///////////////
///////////////////////

// Constructor
Maze::Maze()
{
    srand(time(NULL));
    board_ = new Board();
    turn_count_ = 0;
}

// Initialize a new game, given one human player and 
// a number of enemies to generate
void Maze::NewGame(Player *human, const int enemies)
{
    // Makes sure the number of enemies is 2-4
    if(enemies > 4 || enemies < 2){
        std::cout << "Pick between 2-4 enemies" << std::endl;
        return;
    }
    const int rows = board_->get_rows();
    const int cols = board_->get_cols();

    // Positions of the start and end points
    Position start = {.row = rows-1, .col = 0};
    Position end = {.row = 0, .col = cols-1};
    
    // Initializes the human at the start and the exit at the end
    human->SetPosition(start);
    board_->SetSquareValue(end, SquareType::Exit);
    board_->SetSquareValue(start, SquareType::Human);
    
    // Puts the human player into the order
    players_.push_back(human);
    
    Position pos;
    
    // Creates a new player enemy with the name "Enemy #" and adds them to the order
    for(int i=0; i<enemies; i++)
    {
        std::string name = "Enemy ";
        Player *en = new Player(name += std::to_string(i+1), false);
        players_.push_back(en);
    }
    
    // Goes through each position on the board (except the start and end)
    // and places a wall if the random value is less than two otherwise it
    // tries to place a tressure if the random value is equal to 1
    for(int r=0; r<rows; r++)
    {
        for(int c=0; c<cols; c++)
        {
            if((r != rows-1 || c != 0) && (r != 0 || c != cols-1))
            {
                pos = {.row = r, .col = c};
                int walls = rand()%10+1;
                int tres1 = rand()%10+1;
                int tres2 = rand()%100+1;
                int tres3 = rand()%100+1;
                if(walls <= 2)
                {
                    board_->SetSquareValue(pos, SquareType::Wall);
                }else if(tres1 <= 1)
                {
                    board_->SetSquareValue(pos, SquareType::Treasure1);
                }else if(tres2 <= 5)
                {
                    board_->SetSquareValue(pos, SquareType::Treasure2);
                }else if(tres3 <= 3)
                {
                    board_->SetSquareValue(pos, SquareType::Treasure3);
                }
            }
        }
    }

    // Randomly places enemies on the board, if the position is not empty
    // it tries again
    for(int i=0; i<enemies; i++)
    {
        bool flag = true;
        Position pos;
        while(flag)
        {
            int row = rand()%3;
            int col = rand()%3;
            pos = {.row = row, .col = col};
            if(board_->get_square_value(pos) == SquareType::Empty)
            {
                board_->SetSquareValue(pos, SquareType::Enemy);
                players_[i+1]->SetPosition(pos);
                flag = false;
            }
        }
    }

    // Prints out the initial board
    std::cout << *board_ << std::endl;
    
    Player *p;

    // Starts the turns and ends when gameover is false
    while(IsGameOver())
    {
        // Next player
        p = GetNextPlayer();
        // Their turn
        TakeTurn(p);
    }

    std::cout << GenerateReport() << std::endl;
}

// Helper function to change everything to lower case
char change_case (char c) {
        return std::tolower(c); 
}

// Have the given Player take their turn
void Maze::TakeTurn(Player *p)
{
    // Get the possible moves the player has
    std::vector<Position> options = board_->GetMoves(p);

    // Prints out the possible moves the player can make
    std::cout << p->get_name() <<" can move: ";
    for(int i=0, max = options.size(); i<max; i++)
    {
        std::cout << p->ToRelativePosition(options[i]) << " ";
    }
    std::cout << std::endl;
    
    // Request the players move
    std::cout << "Enter your move: ";
    std::string movein = "";
    Position move;
    bool flag = true;

    // Gets the input and checks if the move is one of the options and if it is
    // it sets the move variable to the option selected otherwise it requests
    // a retry
    while(flag)
    {
        std::cin >> movein;
        std::transform(movein.begin(), movein.end(), movein.begin(), change_case);
        std::cout << movein << std::endl;
        for(int i=0, max = options.size(); i<max; i++)
        {
            if(movein == p->ToRelativePosition(options[i])){
                move = options[i];
                flag = false;
            }
        }
        if(flag){
            std::cout << "Enter one of the options" << std::endl;
        }
    }

    // Moves the player and prints the new board
    board_->MovePlayer(p, move);
    std::cout << *board_ << std::endl;
}

// Get the next player in turn order
Player * Maze::GetNextPlayer()
{
    // If the turn_count_ is above the size of the players_ vector it resets it to 0
    Player *p = players_[turn_count_];
    int max = players_.size();
    if(turn_count_<max-1){
        turn_count_++;
    }else{
        turn_count_ = 0;
    }
    return p;
}

// Return true if the human made it to the exit 
// or the enemies ate all the humans
bool Maze::IsGameOver()
{
    bool human = false;
    bool exit = false;
    Position pos;
    // Checks the whole board if the human and exit are still around
    for(int r=0; r<board_->get_rows(); r++)
    {
        for(int c=0; c<board_->get_cols(); c++)
        {
            pos = {.row = r, .col = c};
            if(board_->get_square_value(pos) == SquareType::Human)
            {
                human = true;
            }else if(board_->get_square_value(pos) == SquareType::Exit){
                exit = true;
            }
        }
    }

    // If the human is gone the game ends and you lose, if the exit is gone
    // you win, otherwise it continues
    if(human == false)
    {
        std::cout << "GAME OVER!!! YOU DIED" << std::endl;
    }else if(exit == false)
    {
        std::cout << "CONGRATULATIONS YOU WON!!!" << std::endl;
    }
    return human && exit;
}

// Prints out the resulting score
std::string Maze::GenerateReport()
{
    return players_[0]->get_name() + " Scored: " + std::to_string(players_[0]->get_points());
}