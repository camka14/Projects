// Author: Samuel Razumovskiy
// PE-1: The purpose for this code is to demonstrate the use of classes for a coordinate system

#include "Point.hpp"
#include <iostream>
#include <vector>

using namespace std;

int main(){
	std::vector<int> cord1{9,4,3,6,2,0};
	std::vector<int> cord2{7,2,6,-2,-9,2};

	Point *p1 = new Point(6); // Creating new points as pointers
	Point *p2 = new Point(cord1);
	Point *p3 = new Point(cord2);
	
	cout<< "Point Locations: (";
	for(int i=0; i<5; i++){
		cout<< p1->get(i) << ",";
	}
	cout<< p1->get(5) << ")" <<endl;

	cout << "(";
	for(int i=0; i<5; i++){
		cout<< p2->get(i) << ",";
	}
	cout<< p2->get(5) << ")" <<endl;

	cout << "(";
	for(int i=0; i<5; i++){
		cout<< p3->get(i) << ",";
	}
	cout<< p3->get(5) << ")" <<endl;

	cout<< "Distances:" << endl;
	cout<< "P1->P2: " << p1->Distance(p2) << ", P1->P3: " << p1->Distance(p3) <<endl; // Calculating the Distances between each of the points
	cout<< "P2->P1: " << p2->Distance(p1) << ", P2->P3: " << p2->Distance(p3) <<endl;
	cout<< "P3->P1: " << p3->Distance(p1) << ", P3->P2: " << p3->Distance(p2) <<endl;
	
	cout<< "Moving Point 2: by +2" << endl;
	p2->Translate(2); // Moving the points
	cout << "(";
	for(int i=0; i<5; i++){
		cout<< p2->get(i) << ",";
	}
	cout<< p2->get(5) << ")" <<endl;

	cout<< "Distances:" << endl;
	cout<< "P1->P2: " << p1->Distance(p2) << ", P1->P3: " << p1->Distance(p3) <<endl; // Calculating the Distances between each of the points
	cout<< "P2->P1: " << p2->Distance(p1) << ", P2->P3: " << p2->Distance(p3) <<endl;
	cout<< "P3->P1: " << p3->Distance(p1) << ", P3->P2: " << p3->Distance(p2) <<endl;

	cout<< "Moving Point 2: by -4" << endl;
	p2->Translate(-4);
	cout << "(";
	for(int i=0; i<5; i++){
		cout<< p2->get(i) << ",";
	}
	cout<< p2->get(5) << ")" <<endl;

	cout<< "Distances:" << endl;
	cout<< "P1->P2: " << p1->Distance(p2) << ", P1->P3: " << p1->Distance(p3) <<endl; // Calculating the Distances between each of the points
	cout<< "P2->P1: " << p2->Distance(p1) << ", P2->P3: " << p2->Distance(p3) <<endl;
	cout<< "P3->P1: " << p3->Distance(p1) << ", P3->P2: " << p3->Distance(p2) <<endl;
}