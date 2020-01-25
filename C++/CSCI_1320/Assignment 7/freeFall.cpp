// Program for calculating freefall distance as a function of time
// d = 1/2 * g * t^2


#include <iostream>
#include <string>

using namespace std;

int main( )
{
	double d;
	const double g = 9.8;
	double t = 10.0;

	cout << "enter time: ";
	cin >> t;

	d = 1.0/2.0 * g * t * t; 

	cout << "distance = " << d << endl;


	return 0;
}
