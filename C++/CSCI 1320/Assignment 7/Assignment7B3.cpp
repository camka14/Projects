#include <iostream>

using namespace std;

int main()
{
	int w;
	int M;
	int t;
	double calories;
	cout << "Input your weight in pounds: ";
	cin >> w;
	cout << "Input the number of METS for your activity: ";
	cin >> M;
	cout << "Input the number of minutes spent on activity: ";
	cin >> t;
	
	calories = 0.0175*M*(w/2.2)*t;
	
	cout << "You burned " << calories << " calories" << endl;
	
	return 0;
}