// Author: Samuel Razumovskiy
// PE-1: The purpose for this code is to demonstrate the use of classes for a coordinate system

#include "Point.hpp"
#include <iostream>

using namespace std;

int main(){
	Point *p1 = new Point; // Creating new points as pointers
	Point *p2 = new Point(-5,6);
	Point *p3 = new Point(2,8);
	int x1 = p1->get_x(); // Getting x and y values for printing out
	int y1 = p1->get_y();
	int x2 = p2->get_x();
	int y2 = p2->get_y();
	int x3 = p3->get_x();
	int y3 = p3->get_y();
	
	cout<< "Point Locations: (" << x1  << "," << y1 << "), (" << x2 << "," << y2 << "), (" << x3 << "," << y3 << ")" << endl;
	cout<< "Distances:" << endl;
	cout<< "P1->P2: " << p1->distance(p2) << ", P1->P3: " << p1->distance(p3) <<endl; // Calculating the distances between each of the points
	cout<< "P2->P1: " << p2->distance(p1) << ", P2->P3: " << p2->distance(p3) <<endl;
	cout<< "P3->P1: " << p3->distance(p1) << ", P3->P2: " << p3->distance(p2) <<endl;
	
	cout<< "Moving Point 2: +2x, +3y" << endl;
	p2->translate(2,3); // Moving the points
	cout<< "(" << p2->get_x() << "," << p2->get_y() << ")" <<endl;

	cout<< "Distances:" << endl;
	cout<< "P1->P2: " << p1->distance(p2) << ", P1->P3: " << p1->distance(p3) <<endl; // Calculating the distances between each of the points
	cout<< "P2->P1: " << p2->distance(p1) << ", P2->P3: " << p2->distance(p3) <<endl;
	cout<< "P3->P1: " << p3->distance(p1) << ", P3->P2: " << p3->distance(p2) <<endl;

	cout<< "Moving Point 2: -4x, -1y" << endl;
	p2->translate(-4,-1);
	cout<< "(" << p2->get_x() << "," << p2->get_y() << ")" <<endl;

	cout<< "Distances:" << endl;
	cout<< "P1->P2: " << p1->distance(p2) << ", P1->P3: " << p1->distance(p3) <<endl; // Calculating the distances between each of the points
	cout<< "P2->P1: " << p2->distance(p1) << ", P2->P3: " << p2->distance(p3) <<endl;
	cout<< "P3->P1: " << p3->distance(p1) << ", P3->P2: " << p3->distance(p2) <<endl;
}