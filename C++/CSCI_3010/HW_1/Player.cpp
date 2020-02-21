#include "Player.h"
#include <string>

Player::Player(const std::string name, const bool is_human)  // constructor
{
	name_ = name;
	is_human_ = is_human;
	points_ = 0;
}

// Adds points to a player
void Player::ChangePoints(const int x)
{
	points_ += x;
}

// set a new position for this player
void Player::SetPosition(Position pos)
{
	pos_ = pos;
}


// into directions relative to the player (up, down, etc)
std::string Player::ToRelativePosition(Position other)
{
	int dy = pos_.row-other.row;
	int dx = pos_.col-other.col;
	if(dx > 0 && dy == 0){
		return "left";
	}else if(dx < 0 && dy == 0){
		return "right";
	}else if(dx == 0 && dy > 0){
		return "down";
	}else if(dx == 0 && dy < 0){
		return "up";
	}else if(dx > 0 && dy > 0){
		return "left down";
	}else if(dx > 0 && dy < 0){
		return "left up";
	}else if(dx < 0 && dy > 0){
		return "right down";
	}else if(dx < 0 && dy < 0){
		return "right up";
	}else{
		return "same";
	}
}
