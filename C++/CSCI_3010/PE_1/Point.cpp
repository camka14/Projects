#include <cmath>
#include "Point.hpp"

// No inputs to declaration
Point::Point(){
    x_ = 0;
    y_ = 0;
}

// X and Y input in the declaration
Point::Point(int x_in, int y_in){
    x_ = x_in;
    y_ = y_in;
}

// Calculates the distance from the current Point object to a given pointer Point object 
float Point::distance(Point *p2){
    int dx = this->get_x() - p2->get_x(); // Can be simplified with by calling x_ and y_ but left as is for readability
    int dy = this->get_y() - p2->get_y();
    return (float) pow(pow(dx,2) + pow(dy,2),0.5); // Calculates the distance
}

// Translates the current Point object by the inputed values
void Point::translate(int x_move, int y_move){
    this->x_ += x_move;
    this->y_ += y_move;
}