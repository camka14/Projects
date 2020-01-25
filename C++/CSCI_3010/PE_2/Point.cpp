#include <cmath>
#include <vector>
#include <iostream>
#include "Point.hpp"

// No inputs to declaration
Point::Point(int n){
	points_.resize(n,0);
	size_ = n;
}

// X and Y input in the declaration
Point::Point(std::vector<int> points){
    points_ = points;
    size_ = points.size();
}

// Calculates the distance from the current Point object to a given pointer Point object 
float Point::Distance(Point *p2){
	if(this->get_size() != p2->get_size()){
		std::cout << "Dimensions don't match!" << std::endl;
	}

	int diff = 0;
    for(int i=0; i<size_;i++){
    	diff += pow(this->get(i) - p2->get(i),2);
    }
    return (float) pow(diff,0.5); // Calculates the distance
}

// Translates the current Point object by the inputed values
void Point::Translate(int move){
    for(int i=0; i<size_; i++){
    	points_[i] += move;
    }
}

void Point::set(int loc, int val){
	points_[loc] = val;
}