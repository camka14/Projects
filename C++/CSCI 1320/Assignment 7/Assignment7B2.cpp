#include <iostream>

using namespace std;

int main()
{
	int n;
	cout << "Find square root of: ";
	cin >> n;
	double guess = n/2.0;
	double r;
	for (int x=0; x<5; x=x+1){
		r = n/guess;
		guess = (guess+r)/2;
	}
	cout << "The square root of: " << n
	<< " is " << guess << endl;
	return 0;
}